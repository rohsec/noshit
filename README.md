## noshit 💩
[![noshitbanner.png](https://i.postimg.cc/8C8HQmx0/noshitbanner.png)](https://postimg.cc/Yv3gQYr6)<br>
A simple wrapper around grep with predifiened filters to remove shit out of your wayback output
<br> 
The script tries to make the life of bughunter easy by removing garbage and filtering uninteresting urls from wayback output


## Requirements:
* egrep

## Installation:
```bash
curl -s https://raw.githubusercontent.com/rohsec/noshit/master/noshit.sh -o noshit.sh && chmod +x noshit.sh && mv noshit.sh /usr/bin/noshit
```

## Usage:
After running the installation command, simply run the below in your terminal
```bash
noshit -h 
```
## Flags
>        -e : additional extension filter
>        -s : additional string filter
>       -q : Quite mode


## Example Usage:
#### [*] To use default filters
```bash 
cat urls.txt|noshit
```

#### [*] To specify additional blacklist extension
```bash
cat urls.txt|noshit -e 'php|js|txt'
```

#### [*] To filter output via additional string
```bash
cat urls.txt|noshit -s 'string1|string2'
```

#### [*] Quite mode, suitable to pipe output to another tool
```bash
cat urls.txt|noshit -q -e 'php|jsp' -s 'assets|static'
```

## Donation (Buy Me a Coffee):
You can encourage me me to contribute more to the open source with donations. NEVER ASKED BUT ALWAYS APPRECIATED.

<a href="https://www.buymeacoffee.com/rohsec" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Screenshots:
[![noshit1.png](https://i.postimg.cc/br4FdDmC/noshit1.png)](https://postimg.cc/K3r5HzSB)

## Legal Disclaimer:
The script is made for educational and ethical purposes only. Usage of the script for attacking targets without prior mutual consent is illegal. The developer is not responsible for any misuse or damage caused by this script.