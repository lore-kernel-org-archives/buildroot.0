From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 6 Dec 2006 08:39:37 +0100
Subject: [Buildroot] Removing packages
References: <0997C816-22B5-4B76-B4EA-88A39989DA01@linux.it>
Message-ID: <004701c71915$9469fc90$38f2bf0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Rafael A Barrero" <rafa@linux.it>
To: <buildroot@uclibc.org>
Sent: Wednesday, December 06, 2006 7:27 AM
Subject: [Buildroot] Removing packages


> Hi;
> 
> During the build process,  as the package is the configured and  
> compiled, is it possible to go back and unselect a particular package  
> so that it isn't included in the final distribution? Does unselecting  
> the package from the configuration menu actually allow the build  
> process to ignore it the next time around? How does one go about  
> doing so (removing a package)?
> 
Buildroot does not support removing packages from the build_<arch>/root
directory, so you have to do it manually or rebuild from scratch.

It would be good if the makefile fragments in packages supported
removing the stuff installed by previous builds.

Even better if binary rpms could be created, and used to build the root directory.

> Thanks again,
> 
> Rafael.

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com
Best AVR  link: www.avrfreaks.net
