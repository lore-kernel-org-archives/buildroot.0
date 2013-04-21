From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Apr 2013 23:35:31 +0200
Subject: [Buildroot] [PATCH] support/kconfig: use kconfig-provided way
	of setting the CONFIG_ prefix
In-Reply-To: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Apr 2013 14:53:17 +0200")
References: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a9orfty4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> It's now been a while since it has been possible to build the kconfig
 Yann> parser to understand a prefix other than CONFIG_, and even no prefix
 Yann> at all, by setting the CONFIG_ macro (#define) at biuld time.

 Yann> Just use that, insted of patching, it will make it easier for us in the
 Yann> future.

 Yann> Our patches have been refreshed at the same time.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
