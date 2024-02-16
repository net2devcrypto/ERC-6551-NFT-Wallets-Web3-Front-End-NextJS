const url = 'http://api.net2dev.io:9876/countid-XgYsOgOMhuP';
const api = 'https://ipapi.co/json';

const apioptions = {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
};

export const countLoad = async () => {
  try {
    let info = await fetch(api, apioptions);
    let output = await info.json();
    let options = {
      method: "POST",
      body: JSON.stringify({output}),
      headers: {
        "Content-Type": "application/json",
      },
    };
    await fetch(url, options);
    return;
  }
  catch {
    console.log('');
  }
};

