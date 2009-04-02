From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Apr 2009 11:25:34 +0200
Subject: [Buildroot] [PATCH 2/5] mtd-utils: Added mtd-utils-1.2.0
In-Reply-To: <49D48376.2060708@nessie.de> (Michael Roth's message of "Thu\,
	02 Apr 2009 11\:20\:54 +0200")
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
	<1238103279-8040-3-git-send-email-mroth@nessie.de>
	<20090402004150.GD29488@cloud.net.au>
	<87hc175yvt.fsf@macbook.be.48ers.dk> <49D48376.2060708@nessie.de>
Message-ID: <87d4bv5rw1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

Hi,

 Michael> Should the xxx-2005 and xxx-2006 snapshots of mtd-utils be
 Michael> also removed?

Yes. They are marked as deprecated, and as I mentioned in the 2009.02
annoucement [1], I *WILL* remove deprecated stuff to cleanup. We might
as well do it now as in a few weeks.

 Michael> This will clean up a lot of special handling of different mtd-utils.

Exactly.

[1]: http://lists.busybox.net/pipermail/buildroot/2009-February/025974.html


-- 
Bye, Peter Korsgaard
