//
//  ContentView.swift
//  SummerOlympics
//
//  Created by Tushar Munge on 6/19/25.
//

import SwiftUI

extension String {
    func capitalizedOrUppercasedLetters() -> String {
        return self.lowercased() == "usa" ? self.uppercased() : self.capitalized
    }
}

struct ContentView: View {
    private let logos = [
        "1924-Paris-France.jpg",
        "1932-los-angeles-usa.jpg",
        "1936-berlin-germany.png",
        "1948-london-england.jpg",
        "1952-helsinki-finland.jpg",
        "1956-melbourne-australia.jpg",
        "1960-rome-italy.jpg",
        "1964-tokyo-japan.jpg",
        "1968-mexico-city-mexico.jpg",
        "1972-munich-germany.png",
        "1976-montreal-canada.jpg",
        "1980-moscow-russia.jpg",
        "1984-los-angeles-usa.jpg",
        "1988-seoul-south-korea.jpg",
        "1992-barcelona-spain.jpg",
        "1996-atlanta-usa.jpg",
        "2000-sydney-australia.jpg",
        "2004-athens-greece.png",
        "2008-beijing-china.jpg",
        "2012-london-england.jpg",
        "2016-rio-brazil.jpg",
        "2020-tokyo-japan.jpeg",
        "2024-paris-france.png",
        "2028-los-angeles-usa.jpg",
        "2032-brisbane-australia",
    ]

    private enum ButtonNavigation {
        case backward
        case forward
    }

    @State private var logoNumber = 22
    @State private var disableLeftNavButton = false
    @State private var disableRightNavButton = false

    var body: some View {

        VStack {
            Text("Olympic Logos")
                .font(.largeTitle)
                .fontWeight(.black)

            Spacer()

            Image("\(getLogoName(from: logos[logoNumber]))")
                .resizable()
                .scaledToFit()

            Spacer()

            VStack {
                Text(
                    "\(getCity(from: logos[logoNumber])), \(getCountry(from: logos[logoNumber]))"
                )

                Text("\(getYear(from: logos[logoNumber]))")
            }
            .font(.largeTitle)
            .fontWeight(.thin)

            HStack {
                Button {
                    logoNumber -= 1
                } label: {
                    Image(systemName: "chevron.left.to.line")
                }
                .disabled(logoNumber == 0)

                Spacer()

                Button {
                    logoNumber += 1
                } label: {
                    Image(systemName: "chevron.right.to.line")
                }
                .disabled(logoNumber == logos.count - 1)
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .tint(.black)

        }
        .padding()
    }

    private func getLogoName(from logoName: String) -> String {
        guard logoName.contains(".") else {

            return logoName
        }

        return String(logoName[..<logoName.firstIndex(of: ".")!])
    }

    private func getYear(from logoName: String) -> String {
        return (logoName.components(separatedBy: "-"))[0]
    }

    private func getCountry(from logoName: String) -> String {
        guard logoName.contains(".") else {

            return String(
                logoName[logoName.index(after: logoName.lastIndex(of: "-")!)...]
            ).capitalizedOrUppercasedLetters()
        }

        return String(
            logoName[
                logoName.index(
                    after: logoName.lastIndex(of: "-")!
                )...logoName.index(before: logoName.lastIndex(of: ".")!)
            ]
        ).capitalizedOrUppercasedLetters()
    }

    // The components() method strips of '-' from any City name
    private func getCity(from logoName: String) -> String {
        return String(
            logoName[
                logoName.index(
                    after: logoName.firstIndex(of: "-")!
                )...logoName.index(before: logoName.lastIndex(of: "-")!)
            ]
        ).capitalizedOrUppercasedLetters().components(separatedBy: "-").joined(
            separator: " "
        )
    }
}

#Preview {
    ContentView()
}
