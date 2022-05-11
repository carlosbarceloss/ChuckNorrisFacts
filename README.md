# 🥇 ChuckNorrisFacts 

A aplicação consiste em possibilitar que o usuário veja, busque e compartilhe fatos sobre o cômico personagem Chuck Norris.

O app está sendo desenvolvido utilizando a linguagem de programação nativa do iOS (Swift) e atualmente sua arquitetura está sendo migrada para MVVM.

### 📔 Requerimentos / recomendações 
- macOS BigSur 11.3+
- Xcode 13.2.1 ([Download por versão aqui](https://xcodereleases.com))
- Swift 5.1
- iOS 13+
- [Homebrew](https://brew.sh/index_pt-br)

# 🧰 Setup do projeto 
Aqui você vai encontrar todas as informações e instruções necessárias para rodar o projeto.

1. Clonar o projeto pelo HTTP
```
https://github.com/carlosbarceloss/ChuckNorrisFacts.git
```
2. Para rodar o projeto, você essencialmente precisa instalar 2 ferramentas: [XcodeGen](https://github.com/yonaskolb/XcodeGen) e [SwiftGen](https://github.com/SwiftGen/SwiftGen).

Sugiro a instalação de ambas através do [homebrew](https://brew.sh/index_pt-br) utilizando os comandos:
```
brew install swiftgen
```
```
brew install xcodegen
```
3. Feito isso, abra o terminal na pasta raíz do projeto, digite o seguinte comando e pressione enter:
```
make xcodegen
```
Serão gerados os arquivos necessários para o projeto funcionar. Após o final da execução do script, você pode abrir e rodar o projeto sem mais problemas! :)
