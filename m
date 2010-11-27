From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Nov 2010 22:30:04 +0100
Subject: [Buildroot] [PATH 00/10] toolchain/crosstool-NG: fixes before
	release, v2
In-Reply-To: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sat, 27 Nov 2010 21:50:40 +0100")
References: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87lj4e1mlf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Hello All!

 Yann> This patch series enables building on a minimalistic host (patch
 Yann> 1, tested in the same mini-environemnt as Thomas), adds some
 Yann> infrastructure (patches 2-5) to be able to push Buildroot options
 Yann> down to uClibc's config (patches 6-10).

Committed, thanks!

 Yann> Changes since v1:
 Yann> - use order-only dependencies on host tools

-- 
Bye, Peter Korsgaard
