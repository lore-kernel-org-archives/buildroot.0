From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Mar 2010 08:20:19 +0100
Subject: [Buildroot] [PATCH] remove -mm linux patch options
In-Reply-To: <0D753D10438DA54287A00B027084269763683A7147@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Wed, 10 Mar 2010 10:50:56 -0600")
References: <0D753D10438DA54287A00B027084269763682CDACA@AUSP01VMBX24.collaborationhost.net>
	<87sk881e33.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763683A7147@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87sk83z7ws.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> I have a follow-up patch to remove the config options from the various
 H> defconfig's if you want it.  Or are they handled a different way?

Yes please. We'll have to check the various defconfigs for bitrot soon,
but we might as well get rid of the MM stuff now.

-- 
Bye, Peter Korsgaard
