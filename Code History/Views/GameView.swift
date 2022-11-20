//
//  ContentView.swift
//  Code History
//
//  Created by Wendy Zhu on 8/24/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel() // when published properties of the viewModel change (i.e. game), update the parts of any view that depends on those properties
    
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswerIndex: 2)
    
    var body: some View {
        ZStack{
            GameColor.main.ignoresSafeArea()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .padding()
                    .multilineTextAlignment(.leading)
                QuestionView(question: viewModel.currentQuestion)
            }
        }
        .background(NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)), isActive: .constant(viewModel.gameIsOver), label: { EmptyView() }))
        .foregroundColor(.white)
        .navigationBarHidden(true)
        .environmentObject(viewModel) // now any subviews to QuestionView will have access to the viewModel with the @EnvironmentObject property wrapper in QuestionView.swift
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
