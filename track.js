const PORT = 8000;

const axios = require('axios')
const cheerio = require('cheerio')
const express = require('express')
const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


const app = express();

const qs = require('qs');
const data = qs.stringify({'txtKeyword': 'PT8213717CL','userlogin': '' });
const config = {
  method: 'post',
  url: 'https://www.globalexplos.com/index/trac.php',
  data
};

const call = () => axios(config)
.then((response) => {
  const html = response.data;
  const $ = cheerio.load(html);
  const tr = $('table.listing tbody tr', html).toArray();

  const size = tr.length;

  const [ first, second, third ] = tr;
  if(size > 20 ) {
    console.log($("\x1b[42m", first).text())
    console.log($("\x1b[42m", second).text())
    console.log($("\x1b[42m", third).text())
  } else {
    console.log('\n', "\x1b[43m", $(first).text(), '\n')
  }
})
.catch((error) => {
  // console.log(error)
  console.log('some kind of error');
});


call()

let i = 0;
process.stdin.on('keypress', (_, b) => {
  if (b.name === 'enter') {
    call()
  }

  if (b.name === 'r') {
    console.log('\n', 'setInterval initiated', '\n')
    setInterval(() => {
      i += 1
      console.log('\n', `called from setInterval ${i}`)
      call()
    }, 100000);
  }

})

app.listen(PORT, () => console.log('server runningo on port: ', PORT))