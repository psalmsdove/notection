//
//  ContentView.swift
//  notection
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var imageData = ImageData()
    @State var showImagePicker: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if imageData.imageNote.isEmpty {
                    Text("try adding an image!")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    HomeView()
                }
            }
            .navigationTitle("notection")
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    imageData.addNote(image: image,
                                      title: "edit me!",
                                      desc: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Label("Image", systemImage: "photo.on.rectangle.angled")
                    }
                    .tint(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            imageData.resetUserData()
                        }
                    } label: {
                        Label("Image", systemImage: "trash")
                    }
                    .tint(.black)
                }
            }
        }
        .environmentObject(imageData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
