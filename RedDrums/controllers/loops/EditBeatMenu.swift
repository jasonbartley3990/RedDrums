//
//  EditBeats.swift
//  RedDrums
//
//  Created by Jason bartley on 12/9/21.
//

import SwiftUI
import CoreData

struct EditBeatMenu: View {
    @Environment(\.presentationMode) var presentationMode
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @State private var loops: [Beat] = []
    
    var onSelection: (Beat) -> Void = { loop in
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text("Select Beat").font(.system(size: 30))
                
                List {
                    ForEach(loops, id: \.self) { loop in
                        HStack {
                            Text(loop.name!)
                            Spacer()
                            
                            NavigationLink(destination: EditABeat(beat: loop).environment(\.managedObjectContext, context), label: {
                                Spacer()
                                Text("Edit")
                            }).foregroundColor(Color.green)
                            Text(" ")
                            Text("Delete").foregroundColor(Color.red).onTapGesture {
                                deleteABeat(beat: loop)
                            }
                        }
                    }
                    
                }
                
                
                HStack {
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.2) , height: geo.size.height * 0.2)
                        
                        Text("Back").foregroundColor(Color.white).font(.system(size: 19))
                        
                    }.onTapGesture {
                        KickPlayer.kick.playSound(sound: "kick1")
                        presentationMode.wrappedValue.dismiss()
                    }.padding()
                    
                    
                    Spacer()
                }
            }
            
        }.onAppear(perform: fetchLoops)
    }
    
   
    
    func fetchLoops() {
        do {
            loops = try context.fetch(Beat.fetchRequest())
        } catch {
            print("opps")
        }
    }
    
    func deleteABeat(beat: Beat) {
        context.delete(beat)
        
        do {
            try self.context.save()
        } catch {
            print("error in saving")
        }
        
        fetchLoops()
    }
}

