const calculator = {
  displayItem: '0',
  firstOperand: null,
  nextOperand: false,
  operator: null,
};

function inputNumb(numb) {
  const { displayItem, nextOperand } = calculator;

  if (nextOperand === true) {
    calculator.displayItem = numb;
    calculator.nextOperand = false;
  } else {
    calculator.displayItem = displayItem === '0' ? numb : displayItem + numb;
  }
}

function inputDecimal(period) {
  if (calculator.nextOperand === true) {
  	calculator.displayItem = "0."
    calculator.nextOperand = false;
    return;
  }

  if (!calculator.displayItem.includes(period)) {
    calculator.displayItem += period;
  }
}

function processOperator(nextOperator) {
  const { firstOperand, displayItem, operator } = calculator;
  const inputValue = parseFloat(displayItem);

  if (operator && calculator.nextOperand)  {
    calculator.operator = nextOperator;
    return;
  }

  if (firstOperand === null && !isNaN(inputValue)) {
    calculator.firstOperand = inputValue;
  }
  else if (operator) {
    const result = operate(firstOperand, inputValue, operator);

    calculator.displayItem = `${parseFloat(result.toFixed(7))}`;
    calculator.firstOperand = result;
  }

  calculator.nextOperand = true;
  calculator.operator = nextOperator;
}


function operate(firstOperand, secondOperand, operator) {

  if (operator === '+') {
    return (firstOperand + secondOperand);
  } else if (operator === '-') {
      return (firstOperand - secondOperand);
  } else if (operator === '*') {
      return (firstOperand * secondOperand);
  } else if (operator === '/') {
      return (firstOperand / secondOperand);
  }  else if (operator==='power'){
      return (Math.pow(firstOperand,secondOperand));
  }

  return secondOperand;
}

function deletePreviousInput(){
  const {displayItem}=calculator;
  calculator.displayItem=displayItem.slice(0, -1);
  }

function resetCalculator() {
  calculator.displayItem = '0';
  calculator.firstOperand = null;
  calculator.nextOperand = false;
  calculator.operator = null;
}

function createDisplay() {
  const display = document.querySelector('.calculator-display');
  display.value = calculator.displayItem;
}

createDisplay();

const buttons = document.querySelector('.calculator-btns');
  buttons.addEventListener('click', event => {
  const { target } = event;
  const { value } = target;
  if (!target.matches('button')) {
    return;
  }

  switch (value) {
    case '+':
    case '-':
    case '*':
    case '/':
    case '=':
    case 'power':
      processOperator(value);
      break;
    case '.':
      inputDecimal(value);
      break;
    case 'clear':
      resetCalculator();
      break;
    case '<--':
      deletePreviousInput();

    default:
      if (Number.isInteger(parseFloat(value))) {
        inputNumb(value);
      }
  }

  createDisplay();
});
