import XCTest
@testable import UserList

@MainActor
final class ViewModelTests: XCTestCase {
    func testInit() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        // When
        viewModel.fetchUsers()
        try await Task.sleep(nanoseconds: 200_000_000) // 0.2 seconds

        // Then
        XCTAssertNotNil(viewModel, "The viewModel shouldn't be nil.")
        print(viewModel.users.count)
    }

    func testSuccessfulUsersFetch() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        // When
        viewModel.fetchUsers()
        try await Task.sleep(nanoseconds: 200_000_000) // 0.2 seconds

        // Then
        XCTAssertTrue(viewModel.users.count > 0)
        XCTAssertFalse(viewModel.users.isEmpty)
        XCTAssertEqual(viewModel.users.count, 20)
    }

    func testFetchUsersSuccess() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        // When
        viewModel.fetchUsers()
        try await Task.sleep(nanoseconds: 200_000_000) // 0.2 seconds

        // Then
        XCTAssertEqual(viewModel.users.count, 20)
        XCTAssertEqual(viewModel.users[0].name.first, "John")
        XCTAssertEqual(viewModel.users[0].name.last, "Doe")
        XCTAssertEqual(viewModel.users[0].dob.age, 31)
        XCTAssertEqual(viewModel.users[0].picture.large, "https://randomuser.me/api/portraits/men/1.jpg")

        XCTAssertEqual(viewModel.users[1].name.first, "Jane")
        XCTAssertEqual(viewModel.users[1].name.last, "Smith")
        XCTAssertEqual(viewModel.users[1].dob.age, 39)
        XCTAssertEqual(viewModel.users[1].picture.medium, "https://randomuser.me/api/portraits/med/women/1.jpg")
    }

    func testReloadUsers() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        // When
        viewModel.reloadUsers()

        // Then
        // The reloadUsers method empty Users
        XCTAssertEqual(viewModel.users.count, 0)

        try await Task.sleep(nanoseconds: 200_000_000)
        XCTAssertEqual(viewModel.users.count, 20)
        XCTAssertEqual(viewModel.users[0].name.first, "John")
        XCTAssertEqual(viewModel.users[0].name.last, "Doe")
    }

    func testShouldLoadMoreData_WhenItemIsLastAndNotLoading_ReturnsTrue() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        viewModel.reloadUsers()
        viewModel.isLoading = false

        try await Task.sleep(nanoseconds: 200_000_000)
        guard let lastUser = viewModel.users.last else {
            XCTFail("Expected at least one user")
            return
        }

        // When
        let result = viewModel.shouldLoadMoreData(currentItem: lastUser)

        // Then
        XCTAssertTrue(result, "Expected true when last item and not loading.")
    }

    func testShouldLoadMoreData_WhenItemIsNotLast_ReturnsFalse() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        viewModel.reloadUsers()
        viewModel.isLoading = false

        try await Task.sleep(nanoseconds: 200_000_000)

        guard viewModel.users.count > 1 else {
            XCTFail("Expected more than one user")
            return
        }

        let notLastUser = viewModel.users.first!

        // When
        let result = viewModel.shouldLoadMoreData(currentItem: notLastUser)

        // Then
        XCTAssertFalse(result, "Expected false when item is not the last user.")
    }

    func testShouldLoadMoreData_WhenIsLoading_ReturnsFalse() async throws {
        // Given
        let repository = MockUserListRepository()
        let viewModel = UserListViewModel(repository: repository)

        viewModel.reloadUsers()
        try await Task.sleep(nanoseconds: 200_000_000)

        viewModel.isLoading = true


        guard let lastUser = viewModel.users.last else {
            XCTFail("Expected at least one user")
            return
        }

        // When
        let result = viewModel.shouldLoadMoreData(currentItem: lastUser)

        // Then
        XCTAssertFalse(result, "Expected false when loading is in progress.")
    }
}
