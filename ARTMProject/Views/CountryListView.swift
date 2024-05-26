//
//  CountryListView.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import SwiftUI

struct CountryListView: View {
    
    @StateObject var viewModel = CountryListViewModel()
    @State var error: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if !viewModel.didFinishFetching {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollViewReader { proxy in
                        ZStack{
                            listOfCountries()
                            alphabeticScrollingBar(proxy: proxy)
                        }
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .alert(isPresented:$viewModel.didFailToFetch) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("Refresh")) {
                    viewModel.getCountriesList()
                  })
        }
    }
    
    fileprivate func listOfCountries() -> some View {
        List {
            ForEach(viewModel.sortedKeys, id: \.self) { key in
                Section(header: Text(String(key))) {
                    ForEach(viewModel.groupedCountries[key]!) { country in
                        ZStack(alignment: .leading) {
                            HStack {
                                Text(country.flag)
                                Text(country.name.common)
                            }
                             NavigationLink(destination: CountryDetailView(country: country)) { EmptyView() }.opacity(0.0)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
    
    fileprivate func alphabeticScrollingBar(proxy: ScrollViewProxy) -> some View {
        HStack {
            Spacer()
            VStack {
                ForEach(0..<viewModel.sortedKeys.count, id: \.self) { idx in
                    Button(action: {
                        withAnimation {
                            proxy.scrollTo(viewModel.sortedKeys[idx], anchor: .top)
                        }
                    }, label: {
                        Text(String(viewModel.sortedKeys[idx]))
                            .font(.footnote)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}

