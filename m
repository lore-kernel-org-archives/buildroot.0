From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Feb 2011 21:47:38 +0100
Subject: [Buildroot] Question: mdev and snd/* device nodes
In-Reply-To: <0D753D10438DA54287A00B027084269764CF157CB5@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Fri, 4 Feb 2011 17:06:40 -0600")
References: <0D753D10438DA54287A00B027084269764CF157CB5@AUSP01VMBX24.collaborationhost.net>
Message-ID: <8762swzy8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> Does mdev have a problem creating device nodes in subdirectories?

Not that I know.

We don't do anything special for mdev configuration, so perhaps it would
make more sense to ask on the busybox mailing list? (busybox at busybox.net)

-- 
Bye, Peter Korsgaard
