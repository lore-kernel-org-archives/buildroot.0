From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Mar 2011 10:55:08 +0200
Subject: [Buildroot] [PATCH] hostcc/hostcxx: fix noccache variant setting
In-Reply-To: <1301296727-28077-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 28 Mar 2011 03:18:47 -0400")
References: <1301296727-28077-1-git-send-email-vapier@gentoo.org>
Message-ID: <877hbjvd3n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The current code accidentally sets up HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE
 Mike> only when the respective HOSTCC or HOSTCXX values are not set.  So if you
 Mike> do something like:
 Mike> 	make HOSTCC=gcc menuconfig
 Mike> The build fails because HOSTCC_NOCCACHE is not set anywhere.

Committed, thanks.

-- 
Bye, Peter Korsgaard
