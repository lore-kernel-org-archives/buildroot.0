From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Dec 2010 23:38:02 +0100
Subject: [Buildroot] [PATCH v2] dhrystone: new benchmark package
In-Reply-To: <1291756047-24633-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Tue, 7 Dec 2010 16:07:27 -0500")
References: <1290235355-31932-1-git-send-email-vapier@gentoo.org>
	<1291756047-24633-1-git-send-email-vapier@gentoo.org>
Message-ID: <8762v3riut.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike> v2
 Mike> 	- leverage TARGET_CONFIGURE_OPTS
 Mike> 	- install into /usr/bin
 Mike> 	- add info to all the patches
 Mike> 	- add patch to pull in malloc/exit/etc... prototypes from C library

Committed, thanks.

-- 
Bye, Peter Korsgaard
