## Step 1:
Open MS Edge to the bing homepage.

[https://bing.com/](https://bing.com/)

## *Step 1.5*
*Login to the account you want to use. (return to [https://bing.com/](https://bing.com/) once completed)*

## Step 2:
Open the developer console *<sub>for the bing homepage</sub>*

*(Windows shortcut is [ __Ctrl__ + __Shift__ + __J__ ] or [ __F12__ ])*

## Step 3:
In the console, paste the following code snippet then press __enter__ to run:
```
// Sleeper function because your pc might be too slow
function sleep(ms) {return new Promise((resolve) => setTimeout(resolve, ms));}

// Creates an image source, allows for src shenanigans
var img = document.createElement("img");

// MAX_POINTS and POINTS_EACH can be changed if the point value is different for you.
var MAX_POINTS = 150;
var POINTS_EACH = 5;

// Loop through the appropriate amount of times for each of the required searches
for (let i = 1; i * POINTS_EACH <= MAX_POINTS; ++i) {
    // format {i} to be the unique search value, log the source, and sleep for 10 ms before continuing.
    img.src = `/search?q=${i}`;
    console.log(img.src);
    await sleep(10);
}

await sleep(1000);

// Open to the points breakdown page to make sure it worked properly
window.open("https://rewards.bing.com/pointsbreakdown","_blank");
```

## Conclusion:
You may need to give the MS rewards page a minute to load, if your points dont show up, try the process again. 
If you have a slow internet connection you may need to try the HTML_Page_Option
