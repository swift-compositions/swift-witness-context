import Testing

import WitnessContext

@Suite
struct `Witness Context Tests` {
  @Suite struct Unit {}
}

extension `Witness Context Tests`.Unit {
  @Test
  func `reexports Witnesses`() {
    #expect(String(reflecting: Witness.self) == "Witness_Primitives.Witness")
  }
}
