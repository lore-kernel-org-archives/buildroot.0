From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Fri, 11 Jul 2008 13:03:15 -0600
Subject: [Buildroot] uclibc/busybox init getting general protection fault
Message-ID: <4877AE73.1070100@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

   I've built a very slim rootfs with buildroot from todays latest svn. 
When I boot the image via qemu, everything is great. However when 
booting on the hardware ( Via C7 CPU ) It all goes along till we get to 
init. Where I get a 'general protection' error with some register values 
somewhere in uclibc (libuClibc.so.0.9.29). I've used i686 and i586 but 
get the same issue in all of them... Any ideas what could cause this?

-- 
Nathanael d. Noblet
Gnat Solutions, Inc
T: 403.875.4613
