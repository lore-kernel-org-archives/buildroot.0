From: Devashish Bhageerutty <db@windarphotonics.com>
Date: Tue, 12 Mar 2019 15:09:04 +0000
Subject: [Buildroot] Adding custom linux config
Message-ID: <HE1PR0702MB361270F873CC0E92047A60CCCF490@HE1PR0702MB3612.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am building an image with an out of tree configuration. I have specified the path to my custom config file in the defconfig and my linux.config is in the folder structure as shown on the Buildroot template. But when I am building or if I do ?make linux-update-(def)config?, my config file is getting overwritten by a generic one. I have checked the /proc/configz on a running system to verify this. This configuration was working before on Buildroot 2015 with linux kernel 3.10 but now I am using Buildroot 2018.02 and kernel 4.14.73. I would be grateful if I could be pointed to what could be causing this or any tests I can make to figure out why this is happening.

Best Regards,

Deva

[windar_logo_email_sig]
Devashish Bhageerutty
Embedded Software Engineer
Windar Photonics A/S
E-mail: db at windarphotonics.com<mailto:db@windarphotonics.com>
Web: www.windarphotonics.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190312/801207f6/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 9595 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190312/801207f6/attachment.png>
