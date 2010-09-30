From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Sep 2010 14:36:36 +0200
Subject: [Buildroot] [PATCH] Makefile: Force make to run serially in the
	top-level Makefile
In-Reply-To: <1285710658-17096-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Tue, 28 Sep 2010 23:50:58 +0200")
References: <1285710658-17096-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87wrq3xvaj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The top-level Makefile can be executed in parallel, as it causes problems.
 Yann> We can force make to be not parallel.

 Yann> It's been reported many times, and recent discussions on IRC with kos_tom,
 Yann> and user nick-named knee, led to this patch.

Cool, I didn't know .NOTPARALLEL - Thanks, committed.

-- 
Bye, Peter Korsgaard
