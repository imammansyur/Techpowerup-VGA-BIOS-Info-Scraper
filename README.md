# Techpowerup VGA BIOS Info Scraper
This is a simple scraper for Techpowerup VGA or GPU BIOS info. I didn't put much thought into making the scraper user-friendly since its a one and done thing. I made this scraper because I needed to find VGA BIOSes from a certain brand and certain model with specific VRAM specification.

# How it works
The scraper saves the webpages of the VGA ID data-id based on what the user provided. Then, you can extract any info that you need using grep on all the webpages.

# How to use
1. Make a list of the VGA BIOS data-id and put it in *'data-id.txt'*
2. Visit *techpowerup.com/vgabios*
3. Open *Inspect Elements -> Network*, then reload
4. At the very top of the list (*techpowerup.com /vgabios/*), right click and *'Copy as cURL (POSIX)'*
5. Paste the cookie header to the scraper code on the response after the */vgabios/$id/$id*
6. Run the scraper

# How to make data-id list
1. Find the Card Model and Card Vendor of VGA/GPU that you need on *techpowerup.com/vgabios*. You might wanna change the brand to *'Unverified Uploads'*
2. Open *Inspect Elements -> Network*, then reload
3. At the very top of the list (*techpowerup.com /vgabios/*), right click -> *'Copy URL'*
4. Run this command: `curl [insert the URL here] | grep -o 'data-id="[0-9]*"' | grep -o '[0-9]*' >> data-id.txt`
6. You might probably need to run the above command again if there's more than 1 page.

# Known issue
CAPTCHA. Since this scraper uses cookie from your browsing session:
- You can't close the page after you're copying the cookie header
- You also need to solve the CAPTCHA on that page when there's HTTP error 429 Too Many Requests.
