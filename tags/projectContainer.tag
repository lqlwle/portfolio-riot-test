<projectContainer>

<div id='header'>
    <h1><b>Nikita J</b>erschov</h1>
    <button onclick={toggleFilter}>Filter New York</button>
    <button onclick={toggleAll}>Show All</button>
</div>

<!--- <p>
  Ich soll { data.length } Divs einfuegen.
</p> -->
<div id="allContent">

  <div class="selfpress">
    <div id="innerContent2">

      <div id="portrait">
          <div id="innerContent3">
          </div>
      </div>
      <p id="selfpresstext">
        Hi, <br />


  At the moment I am studying at the university of applied science in Potsdam.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research, <b><span id="programmingstuff" onmouseover={toggleFilter} onmouseout={toggleAll} name='programmingstuff'>programming/coding</span></b> and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

  I am a interface/user-experience designer, design-researcher and service designer. I am interested in actual research,  and everything related to IT in general. I worked in international start-ups, agencies and research labs.

      </p>

    </div>
  </div>

  <div id="projectmover">
      <projectDiv each={ data.filter(testfilter) } title={Title} maintext={MainText} piclink={PictureLink}> </projectDiv>
  </div>


</div>

<script>

var self = this;

this.data = opts.data;
this.filter_string = '';

toggleFilter(){
  var allDivs = document.querySelectorAll(".projectDiv");

  self.programmingstuff.style.backgroundColor = 'rgb(230,230,255)';

  for (var i = 0; i < allDivs.length; i++) {
    //console.log(allDivs[i])
    allDivs[i].classList.add("shrinkAbit");

    //Positionierung der hover-filter

    allDivs[i].style.marginTop = scrollBarPosition + 'px';

    //---------------------------------

    if (allDivs[i].innerText.indexOf("Vibrosense") < 0 && allDivs[i].innerText.indexOf("Wearables") < 0 )
    {
      allDivs[i].classList.add("shrink");
    }
  }

  setTimeout(function(){
  // self.filter_string = "New York";

  for(var i = 0; i < allDivs.length; i++)
  {
    if (allDivs[i].innerText.indexOf("Vibrosense") < 0 && allDivs[i].innerText.indexOf("Wearables") < 0 )
    {
      allDivs[i].classList.add("disappearNow");
    }
    allDivs[i].classList.remove("shrinkAbit");

  }
  //console.log("Filtere nach New York");
  self.update();
  //console.log("update");
}, 200);

}

toggleAll(){

  //self.filter_string = "";
  self.programmingstuff.style.backgroundColor = '#FFFFFF';

  var allDivs = document.querySelectorAll(".projectDiv");
  for (var i = 0; i < allDivs.length; i++) {
    //console.log(allDivs[i])
      allDivs[i].classList.remove("disappearNow");
  }
  setTimeout(function(){

    for (var i = 0; i < allDivs.length; i++) {
        console.log("unshrinking NOW")
        allDivs[i].classList.remove("shrink");
        allDivs[i].style.marginTop = '0px';
    }

  }, 5);
}

testfilter(item){
  return item.Title.indexOf(this.filter_string) >= 0;
}

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

  /*dataTransfer(d){
    this.data = d;
    console.log("data transfered!")
  }*/

  this.on('mount', function(){
    dataLoad();
  });

</script>

</projectContainer>
