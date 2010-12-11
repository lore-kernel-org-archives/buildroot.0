From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 22:57:34 +0100
Subject: [Buildroot] [PATCH] linux: restore DEPMOD usage
In-Reply-To: <1291800426-28554-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 8 Dec 2010 04:27:06 -0500")
References: <1291800426-28554-1-git-send-email-vapier@gentoo.org>
Message-ID: <87wrngm0q9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The linux.mk rewrite lost the DEPMOD setting while installing modules
 Mike> which means depending on host-module-init-tools has been useless.
 Mike> Instead, the build system has been executing /sbin/depmod.

 Mike> While we're here, drop the INSTALL_MOD_PATH since LINUX26_MAKE_FLAGS
 Mike> already contains it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
