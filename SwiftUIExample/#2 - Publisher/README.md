🔄 Entendendo @Published: Diferenças Cruciais em Relação a @State e @Binding no SwiftUI

Olá, pessoal! 🚀

Continuando nossa jornada pelo SwiftUI, hoje vamos explorar o `@Published` e como ele difere dos já conhecidos `@State` e `@Binding` (falei sobre eles no último post, só colar lá se você não viu). Essas ferramentas são essenciais para a gestão de estados em suas aplicações, mas cada uma tem seu uso específico.

@State e @Binding Recapitulados:
@State é usado para guardar dados dentro de uma única view, reagindo a mudanças e atualizando a UI automaticamente.
@Binding permite que uma view acesse ou modifique o estado de outra view, funcionando como uma ponte entre duas views distintas.

Introduzindo @Published:
- @Published faz parte do conjunto de ferramentas oferecido pelo SwiftUI para trabalhar com dados de forma reativa. Diferentemente de `@State`, que é restrito a uma view, `@Published` é usado dentro de um `ObservableObject`. Isso permite que múltiplas views se inscrevam e reajam às mudanças de estado, facilitando a implementação do padrão MVVM, onde o ViewModel gerencia os dados e a lógica de negócios de forma centralizada.

Por Que Usar @Published?
O uso de `@Published` em um ViewModel promove uma arquitetura mais limpa e modular. As views se mantêm simples e focadas na apresentação, enquanto o ViewModel cuida da lógica de negócios e do estado, que pode ser compartilhado entre várias views sem criar dependências diretas entre elas.

Exemplo em Ação:
No vídeo que acompanha este post, demonstro como integrar `@Published` para auto-preencher campos de endereço com dados da API ViaCEP, simplificando o processo de entrada de dados e garantindo uma experiência de usuário fluida e responsiva.

Como Testar:
Incorpore o código que compartilho no vídeo em seu projeto SwiftUI e observe como a reatividade e a gestão de estados são simplificadas com `@Published`.
Criei também um repositório no github que estarei colocando todas as dicas se for útil pra você dá uma olhada: https://lnkd.in/dh-9UQ92
