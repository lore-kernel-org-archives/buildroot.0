From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 16:03:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <6a2e33620809170445g3c1c8e61t5c413c6a415db5c9@mail.gmail.com>
	(Fathi Boudra's message of "Wed\, 17 Sep 2008 13\:45\:42 +0200")
References: <20080621194717.98BEF3C725@busybox.net>
	<1214130344.2605.8.camel@localhost>
	<87myldra6q.fsf@macbook.be.48ers.dk> <20080622201857.GC10734@mx.loc>
	<87tzflp4yw.fsf@macbook.be.48ers.dk>
	<6a2e33620809170412g35ce7528qc18bf714ed12fbd1@mail.gmail.com>
	<87zlm70zyc.fsf@macbook.be.48ers.dk>
	<6a2e33620809170445g3c1c8e61t5c413c6a415db5c9@mail.gmail.com>
Message-ID: <87k5dazx6q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fathi" == Fathi Boudra <fboudra@gmail.com> writes:

 Fathi> what about backport "add decimal float handling" commit from
 Fathi> Bernhard's git repo. ?

 Fathi>     Please refresh my memory - What does that fix?


 Fathi> Fix gcc-4.3.x build failure on missing fenv.h.
 Fathi> To workaround the issue, we need --disable-decimal-float
 Fathi> so $(GCC_DECIMAL_FLOAT) was introduced.

Ok, I'll merge that chunk.

-- 
Bye, Peter Korsgaard
