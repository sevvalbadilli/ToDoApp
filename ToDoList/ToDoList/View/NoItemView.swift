//
//  NoItemView.swift
//  ToDoList
//
//  Created by ŞEVVAL on 9.08.2024.
//

import SwiftUI

struct NoItemView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20 ){
               checkListImage
                informativeText
                actionButton
                
            }
            .padding(.top,30)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 400)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    private var checkListImage: some View{
        Image(systemName: "checklist")
            .resizable()
            .foregroundColor(.purple)
            .scaledToFit()
            .frame(height: 100)
          
        
    }
    
    private var informativeText: some View{
        VStack{
            
            Text("There is no item yet")
                .font(.title)
                .fontWeight(.semibold)
              
            
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
        }
        
    }
    private var actionButton: some View{
        NavigationLink(destination: AddItemView()){
            
            Text("Add Item")
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(isAnimating ? .secondarAccent : .purple )
                .cornerRadius(10)
            
        }
            .padding(.horizontal, isAnimating ? 30 : 50)
            .shadow(
                color:isAnimating ? Color.secondarAccent.opacity(0.7) : Color.purple.opacity(0.7) ,
                radius: isAnimating ? 30 : 10,
                x: 0,
                y: isAnimating ? 50 : 30)
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            .offset(y: isAnimating ? -7 : 0)
    }
    func addAnimation(){
        
        guard !isAnimating else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
            
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            
            ){
                isAnimating.toggle()
            }
        }
    }
    
    
}

#Preview {
    NavigationView{
        NoItemView()
            .navigationTitle("Title")
        }
}
