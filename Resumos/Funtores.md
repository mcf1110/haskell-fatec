# Funtor Covariante

Um funtor precisa ser um tipo de kind 2. 
Isso quer dizer que ele precisa de um outro tipo para existir.
Ou seja, ele é um __alguma coisa__ de __outra coisa__. É uma Lista de String, 
Tupla de Bool, Pizza de Calabresa, Pastel de Queijo, Bolo de Chocolate (sim, to com fome) etc... 

Quando você fala apenas "Lista", "Tupla" ou "Pizza", fica faltando uma informação, que seria o seu **contéudo**.

Um Funtor é qualquer tipo kind 2 que possa ser convertido usando uma função cuja entrada é do tipo de seu conteúdo.

Ou seja, imagine uma função `adicionarCatupiry` cujo tipo é `Frango -> FrangoComCatupiry`.

Esta função poderia ser mapeada para uma `Pizza Frango`, retornando uma `Pizza FrangoComCatupiry`. Da mesma forma que outra funcao `ab :: a -> b` converte uma `Pizza a` em uma `Pizza b`

Bastaria fazer o seguinte:

```haskell
instance Functor Pizza where
	fmap ab (Pizza a) = Pizza (ab a)
```

O mesmo poderia ser feito com Bolo, Pastel, Tupla ou Lista.

## Exemplo com conversão de arquivos

```haskell
data Pasta a= Pasta a
--Pasta Png, Pasta Jpg, Pasta Mp3, Pasta Txt...

--Para converter uma pasta inteira de uma só vez, bastaria usar fmap

instance Functor Pasta where
	--converter :: (a -> b) Png -> Jpg, Txt -> Mp3...
	fmap converter Pasta a = Pasta (converter a)

--(a -> b) -> f a ->f b
--(a -> b) -> Pasta a ->Pasta b
--(Jpg -> Png) -> Pasta Jpg -> Pasta Png
```

# Funtor Contravariante

Imagine o caso de um barbeiro que só sabe deixar as pessoas carecas (sei lá, to tentando ser didático).

Ele teria o construtor

```haskell
data Barbeiro a = Barbeiro (a -> Careca)
```

A única propriedade do barbeiro é a funcao que deixa careca.

Imagine que na minha rua tem um barbeiro esquisito que só corta cabelos loiros.
Se o seu cabelo é ruivo, preto ou castanho, já era.

```haskell
let esquisito = Barbeiro Loiro
```

Sei que não faz sentido, mas tenta fazer um esforço.

Imagine que eu quero cortar meu cabelo nesse cara. Para isso, eu teria que primeiro pintar o meu cabelo de loiro.

Isso é o que o Funtor Contravariante faz.

Imagine que `a` e `b` são cores de cabelos, e `ab` é a funcao que pinta um cabelo `a`, transformando-o em cabelo `b`

```haskell
instance Contravariant Barbeiro where
	cmap ab (Barbeiro bCareca) = Barbeiro ( bCareca . ab)
	--Ou sem a notacao do ponto: Barbeiro ( bCareca (ab))
```

Então, caso eu rodasse o seguinte:

```haskell
cmap castanhoViraLoiro esquisito
```

Ele me retornaria um barbeiro que corta cabelos castanhos. No final das contas, é como se transformasse castanho em loiro e mandasse para o barbeiro esquisito.

```
(a -> b) -> f b -> f a
(a -> b) -> Barbeiro b -> Barbeiro a
(Castanho -> Loiro) -> Barbeiro Loiro -> Barbeiro Castanho
```

## Exemplo da conversão de arquivos

```haskell
data TextoParaFala text = TextoParaFala (text -> Mp3)
-- text pode ser um arquivo Txt, um arquivo Nfo, ou qualquer arquivo de texto puro

let falarTxt = TextoParaFala (txt2Mp3)
-- imagine que o txt2Mp3 é uma função mágica que converte meus txts para um mp3

--Só que eu tenho um print de um texto, que está no formato jpg. Como eu converteria ele para fala?
instance Contravariant TextoParaFala
	--cmap :: (a -> b) -> f b -> f a
	cmap it (TextoParaFala tm) = TextoParaFala (tm . it)

--Logo, bastaria chamar
cmap jpg2Txt falarTxt
--Que me seria retornado um TextoParaFala que converte jpg para um mp3.

--(a -> b) -> f b -> f a
--(a -> b) -> TextoParaFala b -> TextoParaFala a
--(Jpg -> Txt) -> TextoParaFala Txt -> TextoParaFala Jpg
```

## Exemplo com comida cozida
```haskell

--Todo animal transforma comida em energia. 
--Alguns comem apenas carne, outros são herbívoros, etc...
data Animal comida = Animal {comer :: comida -> Energia}

-- O humano é um animal que come comida cozida
let humano = Animal (metabolizarComidaCozida)

--Mas e se eu tenho uma maneira de cozinhar a comida, pode-se dizer que o 
--ser humano come a comida crua, contanto que ele a cozinhe primeiro.

instance Covariant Animal where
    --ab transforma uma comida a em comida b (crua em cozida, no nosso exemplo),
    --antes do nosso animal comê-la
    cmap ab (Animal comerb) = Animal (comerb . ab)

-- Isso me retorna um Animal que come comida crua
cmap cozinharComida humano

--(a -> b) -> f b -> f a
--(a -> b) -> Animal b -> Animal a
--(Crua -> Cozida) -> Animal Cozida -> Animal Crua
```

# Profuntores

Um profuntor é uma junção de um funtor Covariante com um Contravariante.
Desta forma, ele nos permite lidar com type variables nas posições positiva
e negativa.

Como consequencia, requerem o kind 3.

# Diagramas

## Covariante

```
Funcao Original: a → b
fmap : b → c

Resultado do funtor: (a → b)
			  ↓
		  	  c
```

## Contravariante

```
Funcao Original: a → b
cmap : c → a

Resultado do funtor: (a → b)
		      ↑
		      c
```

## Profuntores

```
Funcao Original: b → c
dimap : a → b, c → d,

Resultado do funtor: (b → c)
		      ↑   ↓
		      a   d
```
