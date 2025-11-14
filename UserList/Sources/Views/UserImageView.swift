//
//  UserImageView.swift
//  UserList
//
//  Created by Eric on 04/11/2025.
//

import SwiftUI

struct UserImageView: View {
    let imageURL: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
            
        } placeholder: {
            ProgressView()
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}

#Preview {
    UserImageView(imageURL: User.example.picture.large, size: 150)
}
