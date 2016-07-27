<projectDiv>

  <div class='projectDiv'>

      <div class='innerContent'>


          <img class= 'project-div-pic' src={opts.piclink} />

          <div name='binder' class='binder' onmouseover={binderOver} onmouseout={binderOut} >
              <h2 name='imgTitle' class='imgTitle'>{opts.title}</h2>
              <p name='desText' class='desText'>{opts.maintext}</p>
          </div>

      </div>
  </div>

  <script>
  var self = this;
  this.binderOver = function() {
    self.binder.style.top = '30%';
    self.binder.style.height = '66%';
    self.imgTitle.style.top = '10%';
    self.desText.style.transition = 'all 2s';
    self.desText.style.opacity = '1';
    //console.log(self.binder);
  }
  this.binderOut = function() {
    self.binder.style.top = '60%';
    self.binder.style.height = '18%';
    self.imgTitle.style.top = '33%';
    self.desText.style.transition = 'all 0.3s';
    self.desText.style.opacity = '0';
    setTimeout(function(){

    }, 500);

    //console.log(self.binder);
  }


  </script>
</projectDiv>
