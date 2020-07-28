

import Foundation
let json = """
{
"Afpak": {
"id": 1,
"race": "hybrid",
"flavors": [
"Earthy",
"Chemical",
"Pine"
],
"effects": {
"positive": [
"Relaxed",
"Hungry",
"Happy",
"Sleepy"
],
"negative": [
"Dizzy"
],
"medical": [
"Depression",
"Insomnia",
"Pain",
"Stress",
"Lack of Appetite"
]
}
},
"African": {
"id": 2,
"race": "sativa",
"flavors": [
"Spicy/Herbal",
"Pungent",
"Earthy"
],
"effects": {
"positive": [
"Euphoric",
"Happy",
"Creative",
"Energetic",
"Talkative"
],
"negative": [
"Dry Mouth"
],
"medical": [
"Depression",
"Pain",
"Stress",
"Lack of Appetite",
"Nausea",
"Headache"
]
}
}
}
""".data(using: .utf8)!

struct Strain: Decodable {
let id: Int
let race: String
let flavors: [String]
let effects: [String: [String]]
}

//decode JSON to swift object

do {
    let dictionary = try JSONDecoder().decode([String: Strain].self, from: json)
var strains = [Strain]()
    for (_, value) in dictionary {
        let strain = Strain(id: value.id, race: value.race, flavors: value.flavors, effects: value.effects)
        strains.append(strain)
    }
    dump(strains)
} catch {
    print(error)
}
