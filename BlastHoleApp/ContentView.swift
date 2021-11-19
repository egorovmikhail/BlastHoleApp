//
//  ContentView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Languages")
                            .font(.system(size: 24))) {
                    ForEach((2...50), id: \.self) {
                        Text("\($0) is even")
                    }
                }
            }
            
            .frame(minWidth: 200, maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        myToggleSidebar()
                    }) {
                        Image(systemName: "sidebar.left")
                    }
                }
            }
            
            BlockView()
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(VStack {
                    Divider()
                    Spacer()
                })
                .toolbar {
                    ToolbarItemGroup {
                        Spacer()
                        Button(action: {
                            print("Button pressed")
                        }) {
                            Image(systemName: "bold.italic.underline")
                        }
                        
                        Button(action: {
                            print("Button pressed")
                        }) {
                            Image(systemName: "lock")
                        }
                    }
                }
        }
        EmptyView()
            .frame(minWidth: 500, minHeight: 300)
    }
}

func myToggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
