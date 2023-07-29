import UIKit



class MoviesListController: UIViewController, Coordinating, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
     
     var coordinator: Coordinator?
     var viewModel: MoviesViewModel!
     
     private var collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.backgroundColor = UIColor.black
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          return collectionView
     }()
     
    private lazy var titlemovie: UILabel = {
         let view = UILabel()
         view.textColor = .white
         view.font = UIFont.systemFont(ofSize: 20)
         view.translatesAutoresizingMaskIntoConstraints = false
         view.text = "Movies Top Rated"
         return view
    }()
    
     // BIND GET SETUP
     private var data: [Movies] {
         return viewModel.model.movies
     }
     
     // MARK: - Initialize
     
     override func viewDidLoad() {
          //self.view.backgroundColor = UIColor(red: 0.0, green: 0.4, blue: 0.0, alpha: 1.0) // Valores RGB para darkgreen
          super.viewDidLoad()
          self.view.addSubview(titlemovie)
          self.view.addSubview(collectionView)
          
          collectionView.delegate = self
          collectionView.dataSource = self
         
          collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
         
          setupContraints()
          bindSetup()
          
          // BIND ASK DATA
          viewModel.getMovies()
     }
     
     // MARK: - Private Functions
     
     private func bindSetup() {
          viewModel = MoviesViewModel(movies: MoviesModel(), service: MoviesService())
          viewModel.reloadCollection = self.reloadCollection
     }
     
     private func setupContraints() {
         
         NSLayoutConstraint.activate([
         titlemovie.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
         titlemovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
         titlemovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    
          collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
          collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
          collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
          collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
          
     }
     
     private func didTapCell(position: IndexPath) {
          let id = String(data[position.row].id)
          coordinator?.navigate(to: .moviesDetails, data: id)
     }
     
     // MARK: - Public Functions
     
     // BIND VIEW - REACTIVE RELOAD FROM VIEW MODEL
     func reloadCollection() {
          DispatchQueue.main.async {
               self.collectionView.reloadData()
          }
          
     }
     
     // MARK: - UICollectionViewDataSource methods
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return data.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
         
         let image = "https://image.tmdb.org/t/p/w500" + data[indexPath.row].posterPath
         cell.imageView.loadImage(from: image)
          
          return cell
     }
     
     // MARK: - UICollectionViewDelegate methods
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          didTapCell(position: indexPath)
     }
     
     // MARK: - UICollectionViewDelegateFlowLayout methods
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let width = (collectionView.frame.width - 16) / 2
          let height = width * 1.5
          return CGSize(width: width, height: height)
     }
}

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
