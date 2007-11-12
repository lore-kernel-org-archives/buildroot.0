From: Felipe Uderman <felipe.uderman@gmail.com>
Date: Mon, 12 Nov 2007 18:16:25 -0300
Subject: [Buildroot] Trying to use buildroot to configure a uClinux Kernel
	for ARM Architecture... please help
Message-ID: <951b8d920711121316l59339959x3b894c9884dbbdca@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have followed the steps described here,
http://buildroot.uclibc.org/buildroot.html, in order to configure a uClinux
image with buildroot. I have configured my kernel, busybox and everything
else with Make Menuconfig, and also saved this configuration on a file. But
then when I run Make, it generates a i386 project folder. I believe this
should be a default configuration, and somehow buildroot is ignoring my
changes. Anyone have idea of what am I doing wrong? Is there something I
should do in order to tell buildroot to use my configurations and not a
default one?

Thank you!

Regards,

Uderman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071112/2414309c/attachment.htm 
