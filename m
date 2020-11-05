From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Thu, 5 Nov 2020 12:17:57 +0000
Subject: [Buildroot] Wifi Issue
Message-ID: <DB7PR10MB2442CF88164CD4E0790F18F082EE0@DB7PR10MB2442.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 2 days  I am trying to have wifi on my STM32MP157C-DK2. THere is no single solution on the net. Why is it so difficult. I didn't ave any problem with ethernet configs.

I spoke with someone he told me to enable some features in the kernel and system configs. Some other person suggest that I modify some files on my target device.  I will provide you with the necessary files and steps that I followed:

1- I followed the guideline here : https://bootlin.com/blog/building-a-linux-system-for-the-stm32mp1-basic-system/

2- then I configured my kernel configs and system configs

3- then I flashed the sdcard. Ethernet worked. Wifi didn't.

I am getting the following errors:

Successfully initialized wpa_supplicant
nl80211: 'nl80211' generic netlink not found
Failed to initialize driver 'nl80211'
wlan0: Unsupported driver 'nl80211'
FAIL

When I lshw I get:
lshw -class network *-network description: Ethernet interface physical id: 1 logical name: eth0 serial: 00:80:e1:42:6b:16 size: 1Gbit/s capacity: 1Gbit/s capabilities: ethernet physical tp aui bnc mii fibre 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation configuration: autonegotiation=on broadcast=yes driver=st_gmac driverversion=Jan_2016 duplex=full ip=192.168.8.15 link=yes multicast=yes port=MII speed=1Gbit/s


Some person required that I use some patch. but I am a beginner. I don't know how to add or use or install the patch.

I am a beginner don't use hard or complicated vocab plz ? I you need any file (kernel config, system config, etc/interfaces, or wpa_supplicant.conf tell me

Best regards

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201105/e5d46229/attachment.html>
