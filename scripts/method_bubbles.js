var methodBubbleContent = [
  {
    title: 'Create',
    text: "The Walls uses visual storytelling to create art which inspires, educates, and develops a community's pride and sense of place through murals, sculpture, and digital installations. To date, The Walls has engaged hundreds of professional artists and thousands of community volunteers to create over <a href='http://beta.thewallsproject.org/programs/murals/'> 90 public art installations</a>, and contribute over $1,000,000 in economic growth to the Capital region's creative sector."
  },
  {
    title: 'Cultivate',
    text: 'Through <a href="http://beta.thewallsproject.org/programs/futures_fund/">The Futures Fund</a>, a STEAM education and workforce development program, The Walls train middle and high school students for the jobs of the future. The ten-week program is administered every spring and fall by highly trained industry professionals to build a sustainable ecosystem of economic empowerment and development with youth.'
  },
  {
    title: 'Reactivate',
    text: 'In order to revitalize and reactivate neighborhoods, The Walls empowers the community, initiates artistic engagement, and encourages volunteers from surrounding areas to participate in <a href="http://beta.thewallsproject.org/programs/mlk/">community driven clean-ups, murals, and enrichment activities.</a>, murals, and enrichment activities.'
  }
]

var currentMethodBubblesIndex = 0;
var methodBubbleTitle = document.getElementById('method-bubbles-title');
var methodBubbleText = document.getElementById('method-bubbles-text');
var methodBubbleButtonLeft = document.getElementById('method-bubbles-button-left');
var methodBubbleButtonRight = document.getElementById('method-bubbles-button-right');

function renderCurrentMethodBubbleInfo() {
  var content = methodBubbleContent[currentMethodBubblesIndex];

  methodBubbleTitle.innerHTML = content.title;
  methodBubbleText.innerHTML = content.text;

  var previousContent = methodBubbleContent[currentMethodBubblesIndex - 1];
  var nextContent = methodBubbleContent[currentMethodBubblesIndex + 1];

  if (previousContent) {
    methodBubbleButtonLeft.innerHTML = "&laquo; " + previousContent.title;
    methodBubbleButtonLeft.style.visibility = 'visible';
  } else {
    methodBubbleButtonLeft.style.visibility = 'hidden';
  }

  if (nextContent) {
    methodBubbleButtonRight.innerHTML = nextContent.title + " &raquo;";
    methodBubbleButtonRight.style.visibility = 'visible';
  } else {
    methodBubbleButtonRight.style.visibility = 'hidden';
  }
}

methodBubbleButtonLeft.addEventListener('click', leftButtonClicked);
methodBubbleButtonRight.addEventListener('click', rightButtonClicked);

function leftButtonClicked() {
  if (currentMethodBubblesIndex <= 0) {
    return;
  }
  currentMethodBubblesIndex = currentMethodBubblesIndex - 1;
  renderCurrentMethodBubbleInfo();
}

function rightButtonClicked() {
  if (currentMethodBubblesIndex >= 2) {
    return;
  }
  currentMethodBubblesIndex = currentMethodBubblesIndex + 1;
  renderCurrentMethodBubbleInfo();
}

renderCurrentMethodBubbleInfo();
