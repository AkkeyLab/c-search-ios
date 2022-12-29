# c-search
This is an app to search corporate info

## Goal
Experiment with an **engaging approach** for iOS app development
- Swift Package Manager
- Swift Concurrency
- SwiftUI
- Combine

## Dependencies
```mermaid
flowchart TB
  subgraph Project
    App<-->A
    subgraph Package
      A[Presentation Package]<-->B[Domain Package]
      B<-->C[Data Package]
    end
  end
  subgraph Third Party
    App<-->D[Packages]
    A<-->E[Packages]
    B<-->F[Packages]
    C<-->G[Packages]
  end
```
