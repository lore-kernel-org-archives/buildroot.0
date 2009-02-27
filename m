From: William Brodie-Tyrrell <william@brodie-tyrrell.org>
Date: Fri, 27 Feb 2009 19:49:50 +0900
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <878wnsmahm.fsf@macbook.be.48ers.dk>
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
	<20090226151511.da1c9b65.william@brodie-tyrrell.org>
	<87hc2gmea8.fsf@macbook.be.48ers.dk>
	<20090227190710.83ff1d6d.william@brodie-tyrrell.org>
	<878wnsmahm.fsf@macbook.be.48ers.dk>
Message-ID: <20090227194950.a345c8d5.william@brodie-tyrrell.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Feb 2009 11:37:25 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> OK, the other at91sam* defconfigs in BR all seems to use OABI. I'll
> check EABI.

OK, I'll give OABI a go.

> Ehh, that's because we don't have a wget.sh (and never had) - Where do
> you see any references to a wget.sh?

When I run make, it seems to use that to download the sources.  If it's not there, make fails while trying to download sources.  On second-look, it seems that the .config file provided by linux4sam has this line in it:

BR2_WGET="$(TOPDIR)/scripts/wget.sh $(BR2_WGET_MIRROR) --passive-ftp --retry-connrefused --waitretry=10"

So you can ignore me complaining about that...


thanks,

-- 
William Brodie-Tyrrell

Carpe Diem - fish of the day.

<william@brodie-tyrrell.org>
http://www.brodie-tyrrell.org/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090227/086d40c4/attachment.pgp>
