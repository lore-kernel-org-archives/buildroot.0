From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2009 18:36:02 +0100
Subject: [Buildroot] gcc-error with latest buildroot
In-Reply-To: <200912261427.53159.marco-glatz@web.de>
References: <200912261427.53159.marco-glatz@web.de>
Message-ID: <20091226183602.0f2debb4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 26 Dec 2009 14:27:53 +0100,
Marco Glatz <marco-glatz@web.de> a ?crit :

> i'm trying to make a toolchain using latest buildroot, but when
> compiling gcc i get this error:

> [/devel/buildroot/output/build/gcc-4.4.2-target/.configured] Fehler 1

Do you really need gcc on your target ?

(Note: of course this is something we should fix, but having gcc and
associated development files on the target is an unusual setup, that's
why it isn't widely tested)

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
