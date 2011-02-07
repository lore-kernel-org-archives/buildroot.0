From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 13:45:33 +0100
Subject: [Buildroot] [PATCH 1/3] debugging: do not require no stripping
In-Reply-To: <1297057752-5850-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 7 Feb 2011 00:49:10 -0500")
References: <1297057741-5809-1-git-send-email-vapier@gentoo.org>
	<1297057752-5850-1-git-send-email-vapier@gentoo.org>
Message-ID: <87lj1sxbbm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The stripping options operate on the final image and not the
 Mike> intermediate builds, so requiring stripping to be disabled just
 Mike> to enable debugging options doesn't make much sense.  Especially
 Mike> when working with gdbserver: only the host needs the debugging
 Mike> information to be available.  The board can run & debug perfectly
 Mike> fine without it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
