# Animation-Flutter

<h4>Construir animações em flutter.</h4>

<blockquote>
  <b>A instância do objeto Animation sabe todo o estado a animação (iniciou, parou, avançando ou retrocedendo), mas ele não sabe nada sobre o que está sendo exibido na tela.</b>
  
  - O AnimationController gerencia o objeto Animation
  
  - A classe CurvedAnimation define progressão como um curva não linear.
  
  - Um Tween (interpolação) utiliza um intervalo de dados para interpolar
  a animação de um objeto. (Exemplo: interpolar de verde para
  vermelhor de 0 a 255).

  - Listeners e StatusListeners monitoram as animações e suas
  mudanças de status.
</blockquote>


<h3>Fade Animation</h3>

<p>Para implementar a animação precisamos nos atentar a 6 grandes partes de código, sendo elas:

1. Herança de classe.
2. Criação dos objetos Animation e
AnimationController
3. Dispose
4. Inicialização (initState)
5. Criação do Widget da animação
6. Evento que dispara ou inicia a animação</p>

<h3>Pulse</h3>

<p>O efeito de pulsação é muito parecido com o efeito de fade, as diferenças serão notas em:

1. Tipo de animação
2. Widget da animação, pois manipula a
altura e largura do elemento visual.</p>


<h3>Slide</h3>

<p>Igual o evento pulse, seguem os pontos de alteração do evento Slide:
  
1. Tipo de animação
2. Widget da animação, pois manipula a
altura e largura do elemento visual.</p>


<h3>Flip</h3>

<p>É um efeito de giro, a forma de construção é muito parecida com os efeitos anterior, segue as diferenças:

1. Tipo de animação
2. Uso da classe Matrix4 para a animação
que auxilia na rotação do eixo de um
Widget.</p>

