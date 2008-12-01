From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Dec 2008 10:23:09 +0100
Subject: [Buildroot] Audio Dir empty?
In-Reply-To: <COL102-DS63F84B368BD657375B8F3DC040@phx.gbl> (Daniel Laird's
	message of "Fri\, 28 Nov 2008 14\:35\:34 +0000")
References: <COL102-DS63F84B368BD657375B8F3DC040@phx.gbl>
Message-ID: <87tz9odzb6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <danieljlaird@hotmail.com> writes:

 Daniel> All the audio/* packages got moved into multimedia/ but the
 Daniel> audio directory and subdirs remain.

Ahh, I'm to blame on this (or rather git-svn). Git doesn't track empty
directories, so when I git-am'ed r24057 it applied the move nicely to
my git tree, but git-svn failed to remove the empty audio directory.

 Daniel> Is this on purpose?
 Daniel> Or should these be cleaned up?

Please do.

-- 
Bye, Peter Korsgaard
