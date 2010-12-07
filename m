From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 23:02:24 +0100
Subject: [Buildroot] [PATCH] linux: drop LDFLAGS override
In-Reply-To: <1289985078-3333-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 17 Nov 2010 04:11:18 -0500")
References: <1289985078-3333-1-git-send-email-vapier@gentoo.org>
Message-ID: <87r5dtqm1b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The current linux code overrides LDFLAGS that the kernel itself might be
 Mike> setting up.  Looking at the history, there doesn't seem to be any reason
 Mike> for this override.  It was added in ea8b1fa6a60705 without any logic.

Committed, thanks.

-- 
Bye, Peter Korsgaard
