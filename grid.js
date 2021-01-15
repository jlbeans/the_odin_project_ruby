const container=document.querySelector('#container');
const grid=document.querySelector('#grid');

function createGrid(cellNumber){
  grid.style.setProperty('--cellNumber',cellNumber);
  for (i=0;i<(cellNumber*cellNumber);i++){
    let gridCell=document.createElement('div');
    gridCell.classList.add='grid-cell';
    gridCell.addEventListener('mouseover',colorGrid);
    grid.appendChild(gridCell);
    container.appendChild(grid);
    }
  }

function colorGrid(e){
  e.target.style.backgroundColor='#495a9c';
}

createGrid(16);

function clearGrid(){
  let gridArray = Array.from(grid.childNodes);
    gridArray.forEach((element) => {
    grid.removeChild(element);
  });
}

function changeSize(){
clearGrid();
let value=prompt('How many squares per side would you like the grid to be?');
let cellNumber=parseInt(value);
if ((cellNumber<1)||(cellNumber>100)){
  alert('Please enter a number between 1 and 100');
  changeSize();
}
else {
  createGrid(cellNumber);
}
}
