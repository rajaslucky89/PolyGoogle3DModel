//
//  MainUIView.swift
//  PolyGoogle3DModel
//
//  Created by Raja Syahmudin on 22/11/20.
//

import SwiftUI
import SceneKit


struct MainUIView: View {
    
    @State var models = [
        DataModel(id: 0, name: "flash", modelName: "flash.usdz"),
        DataModel(id: 1, name: "ironman", modelName: "ironman.usdz"),
        DataModel(id: 2, name: "spiderman", modelName: "spiderman.usdz"),
    ]
    
    @State var index = 0
    
    var body: some View{
        ZStack{
            Color.clear.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Super Hero")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                
                
                SceneView(
                    scene: SCNScene(named: models[index].modelName),
                    options:[.autoenablesDefaultLighting,.allowsCameraControl]
                )
                
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
                
                
                ZStack{
                    HStack{
                        Button(action: {
                            withAnimation{
                                if index > 0{
                                    index -= 1
                                }
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 35, weight: .bold))
                                .opacity(index == 0 ? 0.3 : 1)
                        })
                        .disabled(index == 0 ? true : false)
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation{
                                if index < models.count{
                                    index += 1
                                }
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 35, weight: .bold))
                                // disabling button when no other data ....
                                .opacity(index == models.count - 1 ? 0.3 : 1)
                        })
                        .disabled(index == models.count - 1 ? true : false)
                    }
                    
                    Text(models[index].name)
                        
                        .font(.title3)
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical,30)
                
            }
        }
    }
}


struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
