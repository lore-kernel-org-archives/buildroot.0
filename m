From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 06 Dec 2012 10:14:46 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
Message-ID: <50C06206.6060905@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I have 2 questions around the Buildroot support for iMX6 from Freescale,
especially around graphics.

1) Is there current work on that for a coming release ?
I have noticed that openbricks seem to already have integrated the 
imx6-lib and xdriver-xf86-video-imx

2) I have trying to get both of them integrated in buildroot
The imx6-lib, which will be a 'generic-package', needs includes of the 
target kernel; these includes are not in the sysroot.

What is the most appropriate way to proceed ? The underlying Makefile
has got a "INCLUDE" var to be set, shall I point it to my linux-custom 
build directory ? That does not seem very good.

Thanks
Thierry
