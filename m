From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Mar 2010 14:49:36 +0100
Subject: [Buildroot] [PATCH] remove -mm linux patch options
In-Reply-To: <0D753D10438DA54287A00B027084269763682CDACA@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Tue, 9 Mar 2010 12:08:35 -0600")
References: <0D753D10438DA54287A00B027084269763682CDACA@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87sk881e33.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> The -mm tree is really no longer available since the -next tree 
 H> was created for testing.  It's not even listed on the kernel.org
 H> site any longer.  Plus, the last one that was published as
 H> available was pretty old, 2.6.28-rc2-mm1.

 H> Remove all the -mm patch stuff from Buildroot to clean up the
 H> Linux kernel selection.

Committed, thanks.

-- 
Bye, Peter Korsgaard
