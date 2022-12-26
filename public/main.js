$(document).ready(function(){
const data = {
  ratings: [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }, { id: 5 },
  					{ id: 6 }, { id: 7 }, { id: 8 }, { id: 9 }, { id: 10 }]
};

function unique_container(index){
  const ratingContainers = document.querySelectorAll(".counter-" + index + " #rating");
  const ul = document.createElement("ul");

const stars = data.ratings.map((item, i) => {
  const li = document.createElement("li");
  const a = document.createElement("a");

  let current_rating = document.querySelector(".counter-" + index + " #rating").firstChild.nodeValue;
  a.innerHTML = "&starf;";
  a.id = item.id;

  if(current_rating > i){
    a.classList.add("active");
  }

  a.addEventListener("click", (e) => {
    const listItems = document.querySelectorAll(".counter-" + index +" .stars-container li");
    const currentId = Number(e.target.id);
    let movie_id = document.querySelector(".nav-count-" + index).getAttribute("href").split('/');
    movie_id = movie_id[movie_id.length - 1];

    for (const item of listItems) {
      const a = item.querySelector("a");
      if (a.id <= currentId) {
        a.classList.add("active");
      } else {
        a.classList.remove("active");
      }
    }

    $.ajax({
        url: "/user_rate",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {"movie": movie_id, "ratings": currentId},
        type: "POST",
    });
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

return ul;
}
const starsContainers = document.querySelectorAll(".stars-container");

starsContainers.forEach((container, index) => {
 return container.appendChild(unique_container(index));
})


})