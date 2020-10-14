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


<h4>Fade Animation</h4>
Para implementar a animação precisamos nos atentar a 6 grandes partes de código, sendo elas:
<br/>
1. Herança de classe.
2. Criação dos objetos Animation e
AnimationController
3. Dispose
4. Inicialização (initState)
5. Criação do Widget da animação
6. Evento que dispara ou inicia a animação
