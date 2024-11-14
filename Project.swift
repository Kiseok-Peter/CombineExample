import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CombineExample",
    targets: Module.allCases.map { Target(with: $0) }
)
