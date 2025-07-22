#import "../styles.typ": *


#counter(heading).update(1)
= Fluxo na reta


== Um modo geométrico de pensar

#set par(first-line-indent: 0pt)
Nos três próximos exxercícios, interprete $dot(x) = sin(x)$ como um fluxo sobre a reta.

+  Encontre todos os pontos fixos do fluxo.
  #solution([
    Os *pontos fixos* são tais que $dot(x) = 0$, então:
    $
      dot(x) = 0 arrow.double sin(x) = 0 arrow.double x = k pi, " para " k = 0, plus.minus 1, plus.minus 2, plus.minus 3, dots
    $
  ])

+ Em quais pontos $x$ o fluxo possui maior velocidade para a direita?
  #solution([
    A @fig-dxdt-sin-x mostra o retrato de fase da equação $dot(x) = sin(x)$. Nela. destacamos os *pontos fixos* determinados no item anterior. Observemos que temos *pontos fixos _atratores_*, ou estáveis, ($x^* = (2k+1) pi$, para $k = dots, -2, -1, 0, 1, 2, dots$) e *pontos fixos _repulsores_*,ou instáveis, ($x^* = 2k pi$, para $k = dots, -2, -1, 0, 1, 2, dots$).

    #figure(
      caption: [Retrato de fase da equação $dot(x) = sin(x)$],
      cetz.canvas({
        import cetz.draw: *
        plot.plot(
          size: (13.5, 3),
          axis-style: "school-book", 
          x-tick-step: none, y-tick-step: none,
          x-label: $x$, y-label: $dot(x)$,
          {
            plot.add(domain: (-3*calc.pi, 3*calc.pi), samples: 100,
              calc.sin
            )
            plot.annotate({
              for i in range(-3, 3) {
                let xi = i * calc.pi
                let xf = xi + calc.pi / 2
                if calc.even(i) {
                  line((xi, 0), (xf, 0), mark: (end: ">"), fill: black)
                  circle((i * calc.pi, 0), radius: (4pt, 2pt), fill: white)
                } else {
                  line((xi, 0), (xf, 0), mark: (end: "<"), fill: black)
                  circle((i * calc.pi, 0), radius: (4pt, 2pt), fill: black)
                }
                if i != 0 {
                  let label = str(i)
                  if calc.abs(i) == 1 {
                    label = label.replace(str(i), "")
                  }
                  content((xi,0), anchor: "south", padding: 0.2)[$#label""pi$]
                }
                
              }
              circle((3 * calc.pi, 0), radius: (4pt, 2pt), fill: black)
              content((3 * calc.pi ,0), anchor: "south", padding: 0.2)[$3 pi$]
            })  
          })

      })
    )<fig-dxdt-sin-x>



    Observemos que a velocidade $dot(x)$ é positiva nas regiões $2k pi < x < (2k+1) pi$ para $k = dots -2, -1, 0, 1, 2, dots$. Em cada uma dessas regiões, a velocidade cresce a partir de um ponto repulsor até o valor $frac(4k+1, 2) pi$, quanto atinge seu valor máximo, e, então, decresce em direção a um ponto fixo atrator, com velocidade cada vez menor.
  ])

+ 
  #set enum(numbering: "a)")
  + Encontre a aceleração do fluxo $dot.double(x)$ como função de $x$.
    #solution([
      $
        dot.double(x) = frac(d (dot(x)), d t) = frac(d, d t) [sin(x)] arrow.double dot.double(x) = cos(x) dot(x)\
        arrow.double dot.double(x) = cos(x) sin(x)\
        arrow.double dot.double(x) = frac(1, 2) sin(2x)
      $
    ])

  + Encontre os pontos em que o fluxo tem aceleração positiva máxima.
    #solution([
      Para encontrar os pontos de máxima aceleração positiva, precisamos maximizar a função $dot.double(x)$ determinada no item anterior. Observemos que $sin(2x)$ atinje seu valor máximo de 1 quando:
      $
        2x^* = frac(pi, 2) + 2k pi, " para " k = 0,  plus.minus 1, plus.minus 2, plus.minus 3, dots\
        x^* = frac(pi, 4) + k pi, " para " k = 0,  plus.minus 1, plus.minus 2, plus.minus 3, dots
      $
    ])

+ (Solução exata de $dot(x) = sin(x)$) Como mostrado no texto, $dot(x) = sin(x)$ tem uma solução $t = ln(|frac(csc x_0 + cot x_0, csc(x) + cot(x))|)$ , onde $x_0 = x(0)$ é o valor inicial de $x$.
  #set enum(numbering: "a)")
    + Dado a espcífica condiçõ inicial $x_0 = pi/4$, mostre que a solução acima pode ser invertida para obter
      $
        x(t) = 2 tan^(-1)(frac(e^t, 1 + sqrt(2))).
      $
      Conclua que $x(t) arrow pi$ quando $t arrow infinity$, como mostrado na Seção 2.1. (Você necessita ser bom com identidades trigonométricas para resolver esse problema).
      #solution([
        Inicialmente, calculemos:
        $
          cases(
            csc(x_0) = csc(pi/4) = frac(1, sin(pi/4)) = frac(1, sqrt(2)/2) = 2/sqrt(2)  = sqrt(2)\
            cot(x_0) = cot(pi/4) = 1/tan(pi/4) = 1/1 = 1
          )
          &arrow.double csc(x_0) + cot(x_0) = sqrt(2) + 1\
          &arrow.double csc(x_0) + cot(x_0) = 1 + sqrt(2)
        $
        Substituindo a condição inicial na solução exata, obtemos:
        #text(size: 10pt)[
          $
            t = ln(mid(|)frac(csc x_0 + cot x_0, csc(x) + cot(x))mid(|)) &arrow.double t = ln(mid(|) frac(1 + sqrt(2), csc(x) + cot(x)) mid(|)) arrow.double e^t = frac(1 + sqrt(2), csc(x) + cot(x))\
            &arrow.double frac(1, csc(x) + cot(x)) = frac(2^t, 1 + sqrt(2)) arrow.double frac(1, frac(1, sin(x)) + frac(cos(x), sin(x))) = frac(e^t, 1 + sqrt(2))\
            &arrow.double frac(sin(x), 1+ cos(x)) = frac(e^t, 1 + sqrt(2))
          $ 
          Para resolver a expressão acima, consideremos as seguintes identidades trigonométricas:
          $
            sin 2 theta = 2 sin theta cos theta " e " cos^2 theta = frac(1 + cos 2theta, 2) 
          $
          Substituindo $alpha = 2 theta$ nas identidades acima, obtemos:
          $
            sin alpha = 2 sin(alpha/2) cos(alpha/2) " e " cos^2 (alpha/2) = frac(1 + cos alpha, 2)
          $
          Portanto, substituindo as expressões acima na solução, temos:
          $
            frac(2 sin(x/2) cos(x/2), 2cos^2 (x/2)) = frac(e^t, 1 + sqrt(2)) &arrow.double frac(sin(x/2), cos(x/2)) = frac(e^t, 1 + sqrt(2))\
            &arrow.double frac(sin(x/2), cos(x/2)) = frac(e^2, 1+ sqrt(2))\
            &arrow.double tan(x/2) = frac(e^t, 1 + sqrt(2))\
            &arrow.double x(t) = 2 tan^(-1)(frac(e^t, 1 + sqrt(2)))
          $

          Para determinarmos o comportamento de $x(t)$ quando $t arrow infinity$, seja:
          $
            u = frac(e^t, 1 + sqrt(2)) arrow.double lim_(t arrow infinity) u = lim_(t arrow infinity) frac(e^t, 1 + sqrt(2)) = + infinity
          $
          Portanto,


          $
            lim_(t arrow infinity) x(t) = lim_(u arrow infinity) 2 tan^(-1) (u) = pi
          $
        ]
      ])

    + Tente encontrar a solução analítica para $x(t)$, dado uma condição inicial _arbitrária_.

      #solution([
        No item anterior, obtemos a seguinte identidade trigonométrica:
        $
          frac(1, csc(x) + cot(x)) = tan(x/2)
        $
        Assim, para a solução exata de $dot(x) = sin(x)$, temos:
        $
          t = ln(mid(|) frac(csc(x_0) + cot(x_0), csc(x) + cot(x)) mid(|))  arrow.double e^t = frac(tan(x/2), tan(x_0/2)) arrow.double tan(x/2) = tan(x_0/2) e^t \
          arrow.double x(t) = 2 tan^(-1)[tan(x_0/2) e^t]
        $
      ])

+ (Um análogo mecânico)
  #set enum(numbering: "a)")
  + Encontre um sistema mecânico que seja aproximadamente governado por $dot(x) = sin(x)$.

  + Usando soua intuição física, explique por que agora se torna óbvio que $x^* = 0$ é um ponto fixo instável e $x^* = pi$ é estável.

== Pontos fixos e estabilidade

Analise as seguintes equações graficamente. Em cada caso, desenhe o campo verorial sobre a reta real, encontre todos os pontos fixos, classifique quanto à estabilidade, e desenhe o gráfico de $x(t)$ para diferentes condições iniciais. Então tente por alguns minutos obter a solução analítica para $x(t)$; se você tiver dificuldade, não tente por muito tempo pois em vários casos é impossível resolver a equação em uma forma fechada!

+ $dot(x) = 4x^2 - 16$
  #solution([
    - *Pontos Fixos*
    $
      dot(x) = 0 arrow.double 4x^2 - 16 = 0 arrow.double x^2 = 4 arrow.double x^* = plus.minus 2
    $

      Como indica a @fig-p2.2.1, o ponto fixo $x^* = -2$ é um ponto atrator enquanto o ponto $x^* = 2$ é repulsor.
    - *Campo Vetorial*
    #figure(
      caption: [Campo vetorial unidimensional para $dot(x) = 4x^2 - 16$],
      cetz.canvas({
        import cetz.draw: *
        plot.plot(
          size: (8, 4),
          axis-style: "school-book", 
          x-tick-step: none, y-tick-step: none, 
          x-label: $x$, y-label: $dot(x)$,
          x-ticks: (-2, 2),
          x-min: -4, x-max: 4,
          {
            plot.add(
              domain: (-2.5, 2.5), 
              x => calc.pow(x, 2) - 4
            )
            plot.add(((2, 0),), mark: "o", mark-style: (stroke: black, fill: white))
            plot.add(((-2, 0),), mark: "o", mark-style: (stroke: black, fill: black))
          })
        set-origin((4, 2.556))
        line((0,0), (-1, 0), mark: (end: ">"), fill: black)
        line((-4,0), (-3, 0), mark: (end: ">"), fill: black)
        line((0,0), (1, 0), mark: (end: ">"), fill: black)
        line((4,0), (3, 0), mark: (end: ">"), fill: black)
      })
    )<fig-p2.2.1>

    - *Solução exata*
    $
      frac(d x, d t) = 4x^2 - 16 &arrow.double frac(d x, x^2 - 4) = 4d t arrow.double frac(d x, x^2 - 4) = 4d t\
      &arrow.double frac(d x, (x - 2)(x + 2)) = 4 d t arrow.double 1/4 frac(d x, x-2) - 1/4 frac(d x, x + 2) = 4 d t\
      &arrow.double frac(d x, x+2) - frac(d x, x - 2) = -16 d t\
      &arrow.double integral_(x_0)^x frac(d x, x+2) - integral_(x_0)^x frac(d x, x-2) = -16 integral_0^t d t\
      &arrow.double  (ln |x + 2| lr(|)_(x_0)^x) - (ln |x - 2| lr(|)_(x_0)^x)  = -16t\
      &arrow.double (ln|x + 2| - ln|x_0 + 2|) - (ln|x-2| - ln|x_0 - 2|) = -16 t\
      &arrow.double (ln|x + 2| - ln|x - 2|) - (ln|x_0+2| - ln|x_0 - 2|) = -16 t\
      &arrow.double ln [frac((x+2), (x-2)) frac((x_0 - 2), (x_0 + 2))] = -16t\
      &arrow.double frac((x+2), (x-2)) frac((x_0 - 2), (x_0 + 2)) = e^(-16t)\
      &arrow.double frac(x+2, x-2) = (frac(x_0 + 2, x_0 - 2))  e^(-16t)\
      &arrow.double x + 2 = [(frac(x_0 + 2, x_0 - 2))  e^(-16t)] (x - 2)\
      &arrow.double [1 - (frac(x_0 + 2, x_0 - 2))  e^(-16t)] x = -2 [1 + (frac(x_0 + 2, x_0 - 2))  e^(-16t)]\
      &arrow.double x(t) =  -frac(2(1 + (frac(x_0 + 2, x_0 - 2))  e^(-16t)), 1 - (frac(x_0 + 2, x_0 - 2))  e^(-16t))

    $
  ])



