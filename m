From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 00:05:25 +0100
Subject: [Buildroot] [Review] Add gcc 4.5.1
In-Reply-To: <4CD1B69C.8020402@zacarias.com.ar> (Gustavo Zacarias's message of
	"Wed, 03 Nov 2010 16:23:08 -0300")
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
	<4CD1B69C.8020402@zacarias.com.ar>
Message-ID: <87eib07kqy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> I've been testing this and stuck in a few fixes.
 Gustavo> My changes are at git://repo.or.cz/buildroot-gz.git
 Gustavo> Fixes are various:
 Gustavo> * Fix mpc download site
 Gustavo> * Forward-port the powerpc softfloat patch (you probably didn't hit the
 Gustavo> problem because it's conditional)
 Gustavo> * Disable targetopts for powerpc and gcc 4.5.x
 Gustavo> * Fix a ton of ARM issues

Thanks, pulled and pushed.

-- 
Bye, Peter Korsgaard
