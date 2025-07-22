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
      dot(x) = 0 arrow.double sin(x) = 0 arrow.double x = k pi, " para " pi in 0, 1, 2, dots
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
          size: (9, 2),
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


=== Pontos fixos e estabilidade

#lorem(20)

#pagebreak()