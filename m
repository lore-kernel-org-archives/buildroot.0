From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 01:45:13 +0100
Subject: [Buildroot] [PATCH] linux: set a few more initramfs opts for
	newer kernels
In-Reply-To: <1290224285-21053-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Fri, 19 Nov 2010 22:38:05 -0500")
References: <1290224285-21053-1-git-send-email-vapier@gentoo.org>
Message-ID: <87hbelp27a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Building with linux-2.6.36 and initramfs support causes the build to
 Mike> pause while it prompts for newer options (uid/gid/compression).  So
 Mike> have the build system inject the newer options into the linux config
 Mike> automatically.  Older versions should just ignore these.

Committed, thanks.

-- 
Bye, Peter Korsgaard
