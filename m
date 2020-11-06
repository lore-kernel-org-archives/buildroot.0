From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Fri, 6 Nov 2020 13:12:12 +0000
Subject: [Buildroot] curl: (7) Failed to connect to .... port 80: Connection
 refused
Message-ID: <AM0PR10MB24336FD9E371BA037F4DDCC982ED0@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am new to curl and a colleague created a rest point to see if my STM32MP1 is communicating with it.

when I use
:~$ curl -i -k -X POST -H "Content-Type: application/json" https://dv7knsjzph.execute-api.eu-central-1.amazonaws.com/prod/boxtronic-devices/1/data/

I get this:
curl: (7) Failed to connect to dv7knsjzph.execute-api.eu-central-1.amazonaws.com port 80: Connection refused

Does someone have a solution ?

Thanks

Kevin




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201106/bab9f6dc/attachment.html>
