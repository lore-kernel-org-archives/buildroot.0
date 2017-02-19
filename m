From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Feb 2017 10:01:54 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
 dependencies
In-Reply-To: <XnsA720C4EB5F912berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20170218154333.24496-1-romain.naour@gmail.com>
 <20170218164928.59e0f1c5@free-electrons.com>
 <XnsA720C4EB5F912berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20170219100154.26ddf386@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 19:21:29 +0100, Bernd Kuhls wrote:

> > However, I still don't understand how it can fail on the autobuilders.  
> 
> because the autobuilders fail with BR2_PACKAGE_NCURSES_WCHAR=y:
> http://lists.busybox.net/pipermail/buildroot/2017-January/182468.html

Nope, I tried with BR2_PACKAGE_NCURSES_WCHAR=y locally and it builds
fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
