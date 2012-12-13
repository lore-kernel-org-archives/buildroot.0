From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Dec 2012 09:38:09 +0100
Subject: [Buildroot] [PATCH] uboot-tools: do not override busybox
	uninstall commands
In-Reply-To: <1355366255-7358-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Wed, 12 Dec 2012 21:37:35 -0500")
References: <1355366255-7358-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87y5h2l53i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> The uboot-tools.mk has a copy of BUSYBOX_UNINSTALL_TARGET_CMDS
 Danomi> in it, presumably due to a copy/paste error.  This definition
 Danomi> is overriding the (identical) definition in busybox.mk.

 Danomi> Also, add license info.

Committed, thanks.

-- 
Bye, Peter Korsgaard
