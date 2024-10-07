function openSpawnSelector() {
  document.querySelector("body").style.display = "block";
}

window.addEventListener("message", function (event) {
  let data = event.data;
  if (data.type === "openSpawnSelector") {
      openSpawnSelector();
  }
});

document.onkeyup = function (data) {
  if (data.which == 27) {
      $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
      document.querySelector("body").style.display = "none";
  }
};

function selectLocation(location) {
  $.post(`https://${GetParentResourceName()}/${location}`, JSON.stringify({}));
  document.querySelector("body").style.display = "none";
}

function selectSandy() { selectLocation("sandy"); }
function selectPolice() { selectLocation("police"); }
function selectPaleto() { selectLocation("paleto"); }
function selectAereoporto() { selectLocation("airport"); }
function selectOspedale() { selectLocation("hospital"); }
function selectLastPosition() { selectLocation("lastposition"); }
