From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Feb 2010 11:45:27 +0100
Subject: [Buildroot] [PATCH] toolchain/gdb: get rid of another legacy
	and unused variable
In-Reply-To: <1265644568-31089-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Mon, 8 Feb 2010 16:56:08 +0100")
References: <1265644568-31089-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <878wb2u1q0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> BR2_VENDOR_GDB_VERSION and VENDOR_GDB_VERSION are no longer settable.
 Yann> The only user is gdb, and it's totally useless in this case.

Committed, thanks.

-- 
Bye, Peter Korsgaard
