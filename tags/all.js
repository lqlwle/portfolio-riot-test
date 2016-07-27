riot.tag2('projectcontainer', '<div id="header"> <h1><b>Nikita J</b>erschov</h1> <button onclick="{toggleFilter}">Filter New York</button> <button onclick="{toggleAll}">Show All</button> </div> <div id="allContent"> <div class="selfpress"> <div id="innerContent2"> <div id="portrait"> <div id="innerContent3"> </div> </div> <p id="selfpresstext"> Hi, <br> At the moment I am studying at the university of applied science in Potsdam. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, <b><span id="programmingstuff" onmouseover="{toggleFilter}" onmouseout="{toggleAll}" name="programmingstuff">programming/coding</span></b> and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, and everything related to IT in general. I worked in international start-ups, agencies and research labs. </p> </div> </div> <div id="projectmover"> <projectdiv each="{data.filter(testfilter)}" title="{Title}" maintext="{MainText}" piclink="{PictureLink}"> </projectDiv> </div> </div>', '', '', function(opts) {

var self = this;

this.data = opts.data;
this.filter_string = '';

this.toggleFilter = function(){
  var allDivs = document.querySelectorAll(".projectDiv");

  self.programmingstuff.style.backgroundColor = 'rgb(230,230,255)';

  for (var i = 0; i < allDivs.length; i++) {

    allDivs[i].classList.add("shrinkAbit");

    allDivs[i].style.marginTop = scrollBarPosition + 'px';

    if (allDivs[i].innerText.indexOf("Vibrosense") < 0 && allDivs[i].innerText.indexOf("Wearables") < 0 )
    {
      allDivs[i].classList.add("shrink");
    }
  }

  setTimeout(function(){

  for(var i = 0; i < allDivs.length; i++)
  {
    if (allDivs[i].innerText.indexOf("Vibrosense") < 0 && allDivs[i].innerText.indexOf("Wearables") < 0 )
    {
      allDivs[i].classList.add("disappearNow");
    }
    allDivs[i].classList.remove("shrinkAbit");

  }

  self.update();

}, 200);

}.bind(this)

this.toggleAll = function(){

  self.programmingstuff.style.backgroundColor = '#FFFFFF';

  var allDivs = document.querySelectorAll(".projectDiv");
  for (var i = 0; i < allDivs.length; i++) {

      allDivs[i].classList.remove("disappearNow");
  }
  setTimeout(function(){

    for (var i = 0; i < allDivs.length; i++) {
        console.log("unshrinking NOW")
        allDivs[i].classList.remove("shrink");
        allDivs[i].style.marginTop = '0px';
    }

  }, 5);
}.bind(this)

this.testfilter = function(item){
  return item.Title.indexOf(this.filter_string) >= 0;
}.bind(this)

 function dataLoad(){
    var request = new XMLHttpRequest();
    request.open('Get','content/content.json', true);
    request.onload = function(){
      if(request.status == 200){
        var data = JSON.parse(request.responseText)["projects"];
        self.trigger("dataTransfer", data);
      }
    }
    request.send();
  }

  this.on('dataTransfer', function(d){
      this.data = d;
      this.update();
    })

  this.on('mount', function(){
    dataLoad();
  });

});

riot.tag2('projectdiv', '<div class="projectDiv"> <div class="innerContent"> <img class="project-div-pic" riot-src="{opts.piclink}"> <div name="binder" class="binder" onmouseover="{binderOver}" onmouseout="{binderOut}"> <h2 name="imgTitle" class="imgTitle">{opts.title}</h2> <p name="desText" class="desText">{opts.maintext}</p> </div> </div> </div>', '', '', function(opts) {
  var self = this;
  this.binderOver = function() {
    self.binder.style.top = '30%';
    self.binder.style.height = '66%';
    self.imgTitle.style.top = '10%';
    self.desText.style.transition = 'all 2s';
    self.desText.style.opacity = '1';

  }
  this.binderOut = function() {
    self.binder.style.top = '60%';
    self.binder.style.height = '18%';
    self.imgTitle.style.top = '33%';
    self.desText.style.transition = 'all 0.3s';
    self.desText.style.opacity = '0';
    setTimeout(function(){

    }, 500);

  }

});
