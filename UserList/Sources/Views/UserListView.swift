import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isGridView {
                    UserGridContent(viewModel: viewModel)
                } else {
                    UserListContent(viewModel: viewModel)
                }
            }
            .navigationTitle(viewModel.titleText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ViewModePicker(isGridView: $viewModel.isGridView)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    RefreshButton(action: viewModel.reloadUsers)
                }
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

// MARK: - Content Views

struct UserListContent: View {
    @ObservedObject var viewModel: UserListViewModel

    var body: some View {
        List(viewModel.users) { user in
            NavigationLink(destination: UserDetailView(user: user)) {
                UserCellTypeView(user: user, type: .cellView)
            }
            .onAppear {
                if viewModel.shouldLoadMoreData(currentItem: user) {
                    viewModel.fetchUsers()
                }
            }
        }
    }
}

struct UserGridContent: View {
    @ObservedObject var viewModel: UserListViewModel
    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserCellTypeView(user: user, type: .roundView)
                    }
                    .onAppear {
                        if viewModel.shouldLoadMoreData(currentItem: user) {
                            viewModel.fetchUsers()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Toolbar Components

struct ViewModePicker: View {
    @Binding var isGridView: Bool

    var body: some View {
        Picker(selection: $isGridView, label: Text("Display")) {
            Image(systemName: "rectangle.grid.1x2.fill")
                .tag(true)
                .accessibilityLabel(Text("Grid view"))
            Image(systemName: "list.bullet")
                .tag(false)
                .accessibilityLabel(Text("List view"))
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct RefreshButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel(repository: MockUserListRepository()))
    }
}
