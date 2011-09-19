From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 08:46:06 +0200
Subject: [Buildroot] [git commit] boot: get rid of toplevel submenus
In-Reply-To: <20110918210214.501348D5CD@busybox.osuosl.org>
References: <20110918210214.501348D5CD@busybox.osuosl.org>
Message-ID: <20110919084606.7ff12ec8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 18 Sep 2011 22:09:42 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Sub options are indented anyway, so no need for empty menus / force
> people to enter sub menus to see configuration options.

My preference was the old way. Even if suboptions are indented,  I
think it's a mess in menuconfig to have the U-Boot suboptions in the
middle of the bootloader list.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
