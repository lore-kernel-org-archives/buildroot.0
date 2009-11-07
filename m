From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Nov 2009 11:10:19 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2y208p6yqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Fri\, 6 Nov 2009 13\:16\:10 +0100")
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
	<op.u2y208p6yqa4qb@jap-lappis.nevion.com>
Message-ID: <87k4y2ve5w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 Joachim> Doesn't look good to me, will revert to previous tool chain to
 Joachim> have a look at what it says then. In the old buildroot, we had
 Joachim> the threads library set to linuxthreads, but I have changed
 Joachim> that to NPTL. Could that be the culprit?

Yes, NTPL support in uclibc is still very much work in progress.

-- 
Bye, Peter Korsgaard
