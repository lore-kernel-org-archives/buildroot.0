From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Tue, 3 Nov 2020 14:20:29 +0000
Subject: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
 Unsupported driver 'nl80211'
Message-ID: <AM0PR10MB2433EAA9F63F022A4C6764C582110@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am working with Buildroot, to flash an image on my STM32MP157C-DK2 I wanted to have Wi-Fi working it but I got this error:

Successfully initialized wpa_supplicant
nl80211: 'nl80211' generic netlink not found
Failed to initialize driver 'nl80211'
wlan0: Unsupported driver 'nl80211'
FAIL


I configure the interfaces and wpa_supplicant.conf files correctly normally. I don't know wthat that means but my configuration in the menuconfigand linux-menuconfigis right (I think). Does it maybe have something to do with my target machine (the STM in this case) ?


Every Kind of Help is appreciated since I am a newby in Embedded Linux

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201103/f625450b/attachment.html>
