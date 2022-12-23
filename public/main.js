$(document).ready(function(){
const data = {
  currentRating: 0,
  ratings: [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }, { id: 5 },
  					{ id: 6 }, { id: 7 }, { id: 8 }, { id: 9 }, { id: 10 }]
};

function unique_container(){
const ratingContainers = document.querySelectorAll("#rating");
const ul = document.createElement("ul");

const stars = data.ratings.map((item) => {
  const li = document.createElement("li");
  const a = document.createElement("a");

  a.innerHTML = "&starf;";
  a.id = item.id;

  a.addEventListener("click", (e) => {
    const listItems = document.querySelectorAll(".stars-container li");
    const currentId = Number(e.target.id);

    for (const item of listItems) {
      const a = item.querySelector("a");
      if (a.id <= currentId) {
        a.classList.add("active");
      } else {
        a.classList.remove("active");
      }
    }
for (const rating_container of ratingContainers){
    rating_container.innerText = currentId;
}
  });

  li.appendChild(a);
  return li;
});


for (const star of stars) {
  ul.appendChild(star);
}
// for (let container of starsContainers){
// container.appendChild(ul);
// }
return ul;
}
const starsContainers = document.querySelectorAll(".stars-container");

starsContainers.forEach((container) => {
  console.log(unique_container);
  container.appendChild(unique_container);
  // container.appendChild(ul.cloneNode(true));
})
})