From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Fri, 6 Nov 2020 14:35:45 +0000
Subject: [Buildroot] Restpoint conenction/ Error: HTTP/1.1 502 Bad Gateway
Message-ID: <AM0PR10MB24333F830CBE601C18B0D6EF82ED0@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am getting the following error after trying to test the connection between my STM32MP1 and the Respoint chosen by a collegue.
When I use the command :
curl -i -k -X POST -H "Content-Type: application/json" https://dv7knsjzph.execute-api.eu-central-1.amazonaws.com/prod/boxtronic-devices/2/data/



  *   It works fine on Ubuntu 18.04 (LTS)
  *   Not on my STM32MP1 using Buildroot as distro

We are using JSON and  AWS as Platform.

Does someone have a solution?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201106/0f35fbff/attachment.html>
