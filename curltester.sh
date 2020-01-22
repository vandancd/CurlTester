#!/bin/sh
if [ $1 ];	then
	input_url=$1
	echo "Running test on $input_url ..."
else
	echo "*---------------------------------------------------------*"
	echo "| Usage:\n ./curltester.sh URL to test                    |"
	echo "| For example: $ ./gateway_certs.sh <host.domain.com>     |"
	echo "*---------------------------------------------------------*"
	exit 1
fi

curl -s -w \
'\n
Content Type:           \t%{content_type}
HTTP Code:              \t%{http_code}
HTTP Connect:           \t%{http_connect}
HTTP Version:           \t%{http_version}
Local IP Address:       \t%{local_ip}
Local Port:             \t%{local_port}
# of Connections:       \t%{num_connects}
# of Redirects:         \t%{num_redirects}
URL Scheme:             \t%{scheme}
Bytes Downloaded:       \t%{size_download}
Header Size (bytes):    \t%{size_header}
Request Size (bytes):   \t%{size_request}
Avg. Download Speed:    \t%{speed_download}
SSL Cert Verificaiton:  \t%{ssl_verify_result}
Time to SSL Handshake:  \t%{time_appconnect}
Connect time:           \t%{time_connect}
Lookup time:            \t%{time_namelookup}
PreXfer time:           \t%{time_pretransfer}
StartXfer time:         \t%{time_starttransfer}
Total time:             \t%{time_total}\n' \
-o /dev/null \
$input_url
exit 0
