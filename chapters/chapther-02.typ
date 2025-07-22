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
      Conclua que $x(t) arrow pi$ quando $t arrow infinity$, como mostrado na Seção 2.1. (Você necessita ser bom com identidades trigonométricas para resolver esse pronlema).

    + Tente encontrar a solução analítica para $x(t)$, dado uma condição inicial _arbitrária_.

=== Pontos fixos e estabilidade

#lorem(20)

#pagebreak()