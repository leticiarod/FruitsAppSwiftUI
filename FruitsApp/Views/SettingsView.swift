//
//  SettingsView.swift
//  FruitsApp
//
//  Created by Leticia Rodriguez on 7/14/21.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    
    // provided by us externally, info about the environment
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Section 1
                    
                    GroupBox (
                        label: HStack {
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                        },
                        
                        content: {
                            Divider()
                                .padding(.vertical, 4)
                            HStack(alignment: .center, spacing: 10) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                Text("Most fruits are naturally low in fat, sodium and calories. Non have cholesterol. Fruits are sources of many essentials nutrients including potassium, dietary fiber, vitamins and much more.")
                                    .font(.footnote)
                            }
                        })
                    
                    // MARK: - Section 2
                    
                    GroupBox(label:
                                
                                SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"),
                             
                             content: {
                                Divider().padding(.vertical, 4)
                                Text("If you wish you can restart the app by toggle the switch in this box. Thta way it starts the onboarding process and you will see the welcome screen again.")
                                    .padding(.vertical, 8)
                                    .frame(minHeight: 60)
                                    .layoutPriority(1)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                
                                Toggle(isOn: $isOnboarding, label: {
                                    if isOnboarding {
                                        Text("Restarted".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(.green)
                                    } else {
                                        Text("Restart".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    
                                })
                                .padding()
                                .background(
                                    Color(UIColor.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                )
                    })
                    
                    // MARK: - Section 3
                    
                    GroupBox(label:
                                
                                SettingsLabelView(labelText: "Aplication", labelImage: "apps.iphone")
                             
                             ,
                             
                             
                             content: {
                                
                                SettingsRowView(name: "Developer", content: "Jhon / Jane")
                                SettingsRowView(name: "Designer", content: "Robert Petras")
                                SettingsRowView(name: "Compatibility", content: "iOS 14")
                                SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                                SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                                SettingsRowView(name: "SwiftUI", content: "2.0")
                                SettingsRowView(name: "Version", content: "1.1.0")
                             }) //: BOX
                    
                } //: VSTACK
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing:
                                        
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                        , label: {
                                            Image(systemName: "xmark")
                                        })
                                    
                )
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
