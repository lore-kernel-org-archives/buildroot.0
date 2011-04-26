From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 15:14:17 +0200
Subject: [Buildroot] use Buildroot (with uclibc and busybox) to build
	PREEMPT_RT kernel for AT91RM9200?
In-Reply-To: <8BADEE91F16E11498AEB9FD8D502C1E66C9DADFF04@NLCLUEXM06.connect1.local>
	(Yanli Hu's message of "Sat, 23 Apr 2011 00:56:41 +0200")
References: <8BADEE91F16E11498AEB9FD8D502C1E66C9DADFF04@NLCLUEXM06.connect1.local>
Message-ID: <871v0p5f4m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hu," == Hu, Yanli <Yanli.Hu@philips.com> writes:

 Hu> I wonder if I can use Buildroot (with uclibc and busybox) to build
 Hu> PREEMPT_RT kernel for AT91RM9200? It looks like uclibc lacks some
 Hu> support. Is it possible with the new developments? Thanks!

Yes, the C library doesn't matter for kernel compilation.

-- 
Bye, Peter Korsgaard
