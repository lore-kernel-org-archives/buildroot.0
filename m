From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jan 2011 14:25:17 +0100
Subject: [Buildroot] [PATCH 3/7] toolchain: add a USE_MMU build option
In-Reply-To: <1294669725-5379-3-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:41 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-3-git-send-email-vapier@gentoo.org>
Message-ID: <87ei8e70zm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Some packages need to know whether the MMU is in play, so add a toolchain
 Mike> option to expose the feature to them.

Committed with minor tweaks, thanks.

-- 
Bye, Peter Korsgaard
