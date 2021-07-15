//
//  SettingsRowView.swift
//  FruitsApp
//
//  Created by Leticia Rodriguez on 7/14/21.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - Properties
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - Body
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if let content = content {
                    Text(content)
                } else {
                    if let linkLabel = linkLabel, let linkDestination = linkDestination {
                        Link(destination: URL(string: "https://\(linkDestination)")!, label: {
                            Text(linkLabel)
                        })
                        Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

// MARK: Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            SettingsRowView(name: "Developer", content: "Jhon / Jane")
                .previewLayout(.sizeThatFits)
                .padding()
            SettingsRowView(name: "website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
