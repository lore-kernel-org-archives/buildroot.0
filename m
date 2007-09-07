From: Micha Nelissen <micha@neli.hopto.org>
Date: Fri, 07 Sep 2007 23:56:23 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
In-Reply-To: <200709061850.22829.yann.morin.1998@anciens.enib.fr>
References: <fbkjea$tfd$1@sea.gmane.org>
	<200709061850.22829.yann.morin.1998@anciens.enib.fr>
Message-ID: <46E1C907.6010704@neli.hopto.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> Micha, All,
> 
> Try attached patch.

With this patch I can indeed build a toolchain + root. But it doesn't
boot properly, it hangs after freeing init memory. Tried /bin/echo hello
from /etc/inittab, but no joy.

BTW, with gcc 3.3, /etc/init.d/rcS isn't executed, anyone seen this ?
BTW2, with gcc 3.3, ifup crashes after forking (illegal instruction).
BTW3, is there any script so that udhcpc writes /etc/resolv.conf and
configures the interface it got an IP for ? Interface eth0 e.g. is left
unconfigured for me.

Micha
