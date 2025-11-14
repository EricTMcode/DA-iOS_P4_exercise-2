import Foundation

struct User: Identifiable {
    var id = UUID()
    let name: Name
    let dob: Dob
    let picture: Picture

//    // MARK: - Init
    init(user: UserListResponse.User) {
        self.name = .init(title: user.name.title, first: user.name.first, last: user.name.last)
        self.dob = .init(date: user.dob.date, age: user.dob.age)
        self.picture = .init(large: user.picture.large, medium: user.picture.medium, thumbnail: user.picture.thumbnail)
    }

    // MARK: - Dob
    struct Dob: Codable {
        let date: String
        let age: Int
    }

    // MARK: - Name
    struct Name: Codable {
        let title, first, last: String
    }

    // MARK: - Picture
    struct Picture: Codable {
        let large, medium, thumbnail: String
    }
}

// MARK: - Sample Data
extension User {
    // Example User for Preview
    static var example: User {
        User(
            name: Name(title: "Mr", first: "John", last: "Doe"),
            dob: Dob(date: "1990-05-15", age: 34),
            picture: Picture(
                large: "https://randomuser.me/api/portraits/men/1.jpg",
                medium: "https://randomuser.me/api/portraits/med/men/1.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/men/1.jpg"
            )
        )
    }

    // init for creating test data
        init(name: Name, dob: Dob, picture: Picture) {
            self.name = name
            self.dob = dob
            self.picture = picture
        }
}
