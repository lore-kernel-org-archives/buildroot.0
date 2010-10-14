From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Oct 2010 22:20:19 +0200
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Wed, 13 Oct 2010 14:07:15 -0500")
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
	<4CB5A0BB.2040106@zacarias.com.ar>
	<0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87y6a0edbw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Suggestions?

You could also try going back to mtd-1.3.1, E.G. reverting
a9b783379271e - Maybe something is broken upstream?

-- 
Bye, Peter Korsgaard
