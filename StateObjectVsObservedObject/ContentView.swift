//
//  ContentView.swift
//  StateObjectVsObservedObject
//
//  Created by Eduardo Martin Lorenzo on 17/6/22.
//

// NOTAS:
// Con un ObservedObject si pulsamos el boton incrementar contador, luego el boton añadir y por ultimo otra vez el de incrementar contador, se ve que el listado de videos vuelve al punto inicial. Esto es porque cada vez que se modifica el valor de "counter" la ContentView se vuelve a dibujar y se crea una nueva instancia de VideoVM, por lo que el array con el listado vuelve al punto inicial
// Con StateObject se consigue evitar este problema, ya que no se crea una nueva instancia de VideVM cada vez que se redibuja la pantalla

import SwiftUI

struct ContentView: View {
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            Text("Contador: \(counter)")
                .bold()
                .font(.largeTitle)
                .padding(.top, 12)
            
            Button {
                counter += 1
            } label: {
                Text("Incrementar contador")
            }
            
            ListVideos()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListVideos: View {
    //@ObservedObject private var videoVM = VideoVM()
    @StateObject private var videoVM = VideoVM()
    
    @State private var videosModel: [String] = []
    
    var body: some View {
        NavigationView {
            List(videoVM.videosModel, id: \.self) { video in
                Text(video)
            }
            .navigationTitle("Listado de videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        videoVM.addMoreTopics()
                    } label: {
                        Text("Añadir")
                    }
                    
                }
            }
        }
    }
}
