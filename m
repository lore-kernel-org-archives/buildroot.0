From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 18:16:10 +0100
Subject: [Buildroot] [PATCH] V2: Add package bonnie++
In-Reply-To: <1297096132-5433-1-git-send-email-mort@bork.org> (Martin Hicks's
	message of "Mon, 7 Feb 2011 11:28:52 -0500")
References: <20110201220238.2c218fcd@surf>
	<1297096132-5433-1-git-send-email-mort@bork.org>
Message-ID: <87sjvzvk85.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:

 Martin> A good filesystem performance benchmark program.
 Martin> Fixed up a few things requested by reviewers.

Bonnie++ is implemented in C++, right? If so, you need to depend on
LIBSTDCPP (and add a comment statement if it isn't available) - See
E.G. package/iperf/Config.in for an example.

-- 
Bye, Peter Korsgaard
