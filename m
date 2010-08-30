From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 22:57:39 +0200
Subject: [Buildroot] Make 3.82 does behave differently than make
	3.81	for sure, but ...
In-Reply-To: <4C7C12E3.30005@jdines.net> (James J. Dines's message of "Mon, 30
	Aug 2010 16:21:55 -0400")
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
	<4C7BD1D6.5070100@jdines.net>
	<20100830163153.GA12776@merkur.ravnborg.org>
	<8739tvyip6.fsf@macbook.be.48ers.dk> <4C7C12E3.30005@jdines.net>
Message-ID: <87y6bnx1h8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James J Dines <jdines@jdines.net> writes:

Hi,

 James> I am really interested to hear your results, because I just
 James> bought this new 8 core machine and set it up this weekend.  So
 James> far everything has worked great, but there is always this
 James> nagging worry that I have something set up wrong and I will have
 James> to post back to the list stating that I was an idiot and missed
 James> something :-)

 James> In any case, untarring buildroot-2010.05, doing a make defconfig
 James> followed by a make clean seems like a set of steps that should
 James> go off without a hitch (it certainly does on my other machine)
 James> but it fails with make 3.82 for me anyway :-(

 James> [jdines at hydra buildroot-2010.05 ] make clean
 James> package/atk/atk.mk:43: *** recipe commences before first target.  Stop.

Yeah, that's the bug in atk.mk Yann fixed earlier today. Could you give
git a try instead (either git clone or wait for tomorrows snapshot
tarball).

-- 
Bye, Peter Korsgaard
