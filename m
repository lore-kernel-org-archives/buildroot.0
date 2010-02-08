From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Feb 2010 17:06:24 +0100
Subject: [Buildroot] [PATCH] toolchain/gdb: get rid of legacy & unused
	variables
In-Reply-To: <1265643595-30763-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Mon, 8 Feb 2010 16:39:55 +0100")
References: <1265643595-30763-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87wrynsoe7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The BR2_VENDOR_SUFFIX and VENDOR_SUFFIX variables are no longer unsettable.
 Yann> The only user is gdb, and is totally useless in this case.

 Yann> Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Thanks, committed!

-- 
Bye, Peter Korsgaard
