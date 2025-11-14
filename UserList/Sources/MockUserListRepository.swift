//
//  MockUserListRepository.swift
//  UserList
//
//  Created by Eric on 08/11/2025.
//

import Foundation

struct MockUserListRepository: UserListRepositoryProtocol {
    
    func fetchUsers(quantity: Int) async throws -> [User] {
        let allUsers: [User] = [
            User(name: .init(title: "Mr", first: "John", last: "Doe"),
                 dob: .init(date: "1990-05-15", age: 31),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/1.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/1.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/1.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Jane", last: "Smith"),
                 dob: .init(date: "1985-07-20", age: 39),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/1.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/1.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/1.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Enrico", last: "Massias"),
                 dob: .init(date: "1988-03-10", age: 37),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/2.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/2.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/2.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Emma", last: "Johnson"),
                 dob: .init(date: "1992-09-25", age: 32),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/2.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/2.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/2.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Michael", last: "Lee"),
                 dob: .init(date: "1991-02-12", age: 33),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/3.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/3.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/3.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Olivia", last: "Garcia"),
                 dob: .init(date: "1994-06-08", age: 30),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/3.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/3.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/3.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Daniel", last: "Martinez"),
                 dob: .init(date: "1989-11-30", age: 35),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/4.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/4.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/4.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Sophia", last: "Anderson"),
                 dob: .init(date: "1993-04-18", age: 32),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/4.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/4.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/4.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Liam", last: "Wilson"),
                 dob: .init(date: "1987-07-11", age: 38),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/5.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/5.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/5.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Isabella", last: "Thomas"),
                 dob: .init(date: "1996-01-09", age: 29),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/5.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/5.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/5.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Ethan", last: "Taylor"),
                 dob: .init(date: "1990-10-22", age: 34),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/6.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/6.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/6.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Mia", last: "White"),
                 dob: .init(date: "1995-05-30", age: 30),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/6.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/6.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/6.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Noah", last: "Harris"),
                 dob: .init(date: "1986-09-14", age: 39),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/7.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/7.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/7.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Ava", last: "Clark"),
                 dob: .init(date: "1998-12-02", age: 26),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/7.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/7.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/7.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Lucas", last: "Lewis"),
                 dob: .init(date: "1984-03-05", age: 41),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/8.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/8.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/8.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Charlotte", last: "Walker"),
                 dob: .init(date: "1991-08-21", age: 33),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/8.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/8.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/8.jpg"
                 )),
            User(name: .init(title: "Mr", first: "James", last: "Hall"),
                 dob: .init(date: "1983-11-10", age: 42),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/9.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/9.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/9.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Amelia", last: "Allen"),
                 dob: .init(date: "1993-02-27", age: 32),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/9.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/9.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/9.jpg"
                 )),
            User(name: .init(title: "Mr", first: "Benjamin", last: "Young"),
                 dob: .init(date: "1989-06-13", age: 36),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/men/10.jpg",
                    medium: "https://randomuser.me/api/portraits/med/men/10.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/men/10.jpg"
                 )),
            User(name: .init(title: "Ms", first: "Ella", last: "King"),
                 dob: .init(date: "1997-09-09", age: 28),
                 picture: .init(
                    large: "https://randomuser.me/api/portraits/women/10.jpg",
                    medium: "https://randomuser.me/api/portraits/med/women/10.jpg",
                    thumbnail: "https://randomuser.me/api/portraits/thumb/women/10.jpg"
                 ))
        ]
        
        return Array(allUsers.prefix(quantity))
    }
}
