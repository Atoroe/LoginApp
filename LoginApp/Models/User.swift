struct User {
    let user = "User"
    let password = "Password"
    let character: Character
    let creators: Creators
    
    static func getUser() -> User {
        User(character: Character(
                name: "Homer",
                surname: "Simpson",
                age: 38,
                gender: "Male",
                occupation: "Nuclear power plant operator",
                maritalStatus: "Maried",
                spouse: "Marge Simpson"),
             creators: Creators(creator: "Matt Groening",
                                designer: "Matt Groening")
        )
    }
}
