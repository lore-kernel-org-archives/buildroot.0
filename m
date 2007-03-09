From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Mar 2007 09:53:08 +0100
Subject: [Buildroot] Native POSIX Threading (NPTL)
In-Reply-To: <1172594168.2813.6.camel@ndragon.eng.wgate.com>
References: <1172594168.2813.6.camel@ndragon.eng.wgate.com>
Message-ID: <20070309085308.GE11011@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 27, 2007 at 11:36:07AM -0500, James Newell wrote:
>Hello,
>
>The latest snapshot of uclibc seems to have removed NPTL support for
>arm.

AFAIK there never was NTPL support before, and nothing was removed.
This is a uClibc issue, so you'd be better off to have asked on the
uClibc list. That said, current uClibc-svn has working linuxthreads.old
support for ARM, ask your favourite web indexer about uClibc arm NTPL

HTH,
