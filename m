From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Wed, 19 Jun 2013 06:34:48 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <51C08403.4050900@mind.be>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
Message-ID: <kpqg93$v74$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>   If you explicitly ask to build binutils (for the target), then the value of
> BR2_PACKAGE_BINUTILS is ignored. So 'make binutils' tries to build binutils
> for the target.

Sorry, to clarify - I get the error running just "make", but if I want to 
experiment by changing build flags, I can run "make binutils" to skip 
recompiling gcc, uclibc, etc. and just attempt the bit that recently failed.

This is just a timesaver when testing though, the real problem is that I still 
get these errors from the target binutils when running "make".

Thanks,
Adam.
