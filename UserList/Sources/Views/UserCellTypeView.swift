//
//  UserCellView.swift
//  UserList
//
//  Created by Eric on 04/11/2025.
//

import SwiftUI

enum ListViewType {
    case cellView
    case roundView
}

struct UserCellTypeView: View {
    let user: User
    let type: ListViewType

    var body: some View {
        switch type {
        case .cellView:
            HStack {
                UserImageView(imageURL: user.picture.thumbnail, size: 50)

                VStack(alignment: .leading) {
                    Text("\(user.name.first) \(user.name.last)")
                        .font(.headline)
                    Text("\(user.dob.date)")
                        .font(.subheadline)
                }
            }
        case .roundView:
            VStack {
                UserImageView(imageURL: user.picture.large, size: 150)

                Text("\(user.name.first) \(user.name.last)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    UserCellTypeView(user: .example, type: .cellView)
}
