//
//  CustomizationMenu.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI

struct CustomizationMenu: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var ShowingNewSetAlert = false
    @State private var newSetName = "enter name"
    @State private var sets: [DrumKit] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        ZStack {
                            Circle().fill(Color.white).frame(width: geo.size.height * 0.2, height: geo.size.height * 0.2)
                            
                            Text("Back").foregroundColor(Color.black)
                        }.onTapGesture {
                            MidTomPlayer.MidTom.playSound(sound: "midTom1")
                            HapticsManager.shared.hapticShakeIntense()
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        NavigationLink(destination: ChooseExistingSetForEdit().environment(\.managedObjectContext, context), label: {
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.75) , height: geo.size.height * 0.75)
                                
                                VStack {
                                    Image(systemName: "wrench").resizable().foregroundColor(Color.white).frame(width: geo.size.height * 0.3, height: geo.size.height * 0.3).aspectRatio(contentMode: .fit)
                                    
                                    Text("Edit Existing Set").font(.system(size: 25)).foregroundColor(Color.white)
                                    
                                }
                                
                                
                            }
                        })
    
                        NavigationLink(destination: CustomizeDrumSet().environment(\.managedObjectContext, context), label: {
                            ZStack {
                                Circle().fill(Color.white).frame(width: (geo.size.height * 0.75) , height: geo.size.height * 0.75)
                                
                                VStack {
                                    Image(systemName: "plus").resizable().frame(width: geo.size.height * 0.3, height: geo.size.height * 0.3).aspectRatio(contentMode: .fit)
                                    Text("Create New Set").font(.system(size: 25))
                                }
                                
                            }
                        })
                    }
                }
            }
        }.onAppear(perform: {
            fetchSets()
            prepareHaptics()
        } )
    }
    
    func fetchSets() {
        do {
            self.sets = try context.fetch(DrumKit.fetchRequest())
            
        } catch {
            
        }
    }
    
    func prepareHaptics() {
        HapticsManager.shared.prepareHaptics()
    }
}

struct CustomizationMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomizationMenu()
    }
}
