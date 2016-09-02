From: Mythbu2 <mythbu2@yahoo.de>
Date: Fri, 2 Sep 2016 08:48:55 +0200
Subject: [Buildroot] Remove all kernel modules from a buildroot build
Message-ID: <57C920D7.5070104@yahoo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've successfully build a custom Linux system with buildroot (stable 
release 2016.05) for the Raspberry Pi. Everything works fine so far and 
buildroot is a really nice tool.

I've one question for which I don't find an answer in the docs or on the 
web: the directory /lib/modules/4.4.8 contains all kernel modules and 
consumes around 93% of the entiere root filesystem. My system does not 
need any kernel modules and modules like dvb-* are included which I'll 
certainly not used.

Is there a way of configuring buildroot to omit all this modules and 
save the space and therefore reduce the image size?

Regards,
mythbu
