ProgramNode(0...28)(
  ScopeNode(0...0)([]),
  StatementsNode(0...28)(
    [CallNode(0...28)(
       nil,
       nil,
       IDENTIFIER(0...1)("f"),
       nil,
       nil,
       nil,
       BlockNode(2...28)(
         ScopeNode(2...3)(
           [IDENTIFIER(5...6)("a"),
            IDENTIFIER(8...9)("b"),
            IDENTIFIER(17...18)("c"),
            IDENTIFIER(20...21)("d"),
            IDENTIFIER(24...25)("e")]
         ),
         BlockParametersNode(5...25)(
           ParametersNode(5...25)(
             [RequiredParameterNode(5...6)(),
              RequiredParameterNode(20...21)()],
             [OptionalParameterNode(8...14)(
                IDENTIFIER(8...9)("b"),
                EQUAL(10...11)("="),
                IntegerNode(12...14)()
              )],
             RestParameterNode(16...18)(
               USTAR(16...17)("*"),
               IDENTIFIER(17...18)("c")
             ),
             [],
             nil,
             BlockParameterNode(23...25)(IDENTIFIER(24...25)("e"), (23...24))
           ),
           []
         ),
         nil,
         (2...3),
         (27...28)
       ),
       "f"
     )]
  )
)
