
class MoviesViewModel {
     
    var service: MoviesServiceType
    var model: MoviesModelType
    
    var reloadCollection: (() -> Void)?
    
    init(movies: MoviesModelType, service: MoviesServiceType) {
        self.model = movies
        self.service = service
    }
    
    func getMovies() {
        service.getMovies { [weak self] data, error in
            self?.model.setMovies(response: data)
            self?.reloadCollection?()
        }
    }
     
}
