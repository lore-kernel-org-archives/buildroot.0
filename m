From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jun 2012 10:45:53 +0200
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
In-Reply-To: <js1vea$ns$1@dough.gmane.org>
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
 <jkfl6r$bev$1@dough.gmane.org> <20120322175530.1f14a73a@skate>
 <4F6B677E.4020706@gmail.com> <js1vea$ns$1@dough.gmane.org>
Message-ID: <20120623104553.6a1cd9d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 22 Jun 2012 16:28:28 +0200,
Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com> a ?crit :

> Too many arguments

You're using Buildroot 2011.05, and the problem you're facing is a
limitation in the external toolchain wrapper, which has been fixed
since then.

For reference, this problem has been fixed by
e8c46b118b011c766511c44fa9232e074ad6bcbc. So either you need to upgrade
your Buildroot version, or you need to backport this patch in 2011.05
(which should be relatively easy since this change has been made no
long after the 2011.05 release).

Best regards,


Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
