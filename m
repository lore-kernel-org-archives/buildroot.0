From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 09:07:17 +0200
Subject: [Buildroot] [git commit] boot: get rid of toplevel submenus
In-Reply-To: <87vcsp58ey.fsf@macbook.be.48ers.dk>
References: <20110918210214.501348D5CD@busybox.osuosl.org>
 <20110919084606.7ff12ec8@skate>
 <87vcsp58ey.fsf@macbook.be.48ers.dk>
Message-ID: <20110919090717.718192b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Sep 2011 08:54:29 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> My preference was the old way. Even if suboptions are
>  Thomas> indented,  I think it's a mess in menuconfig to have the
>  Thomas> U-Boot suboptions in the middle of the bootloader list.
> 
> I find the empty submenus when E.G. u-boot isn't enabled pretty ugly,

That could probably be fixed at the kconfig level, though I admit
making changes to this code is always a challenge.

> and use of a normal config is by far the most used option - E.G:
> 
> git grep '^menuconfig '|wc -l
> 10
> 
> Out of ~700 packages, bootloaders, filesystems, ..

It's not because it's the most commonly used option that I like it :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
