From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 16:39:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
In-Reply-To: <20090128153542.0132D769CC@busybox.osuosl.org>
	(laird@uclibc.org's message of "Wed\,
	28 Jan 2009 15\:35\:41 +0000 \(UTC\)")
References: <20090128153542.0132D769CC@busybox.osuosl.org>
Message-ID: <873af3v3ru.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2009-01-28 15:35:39 +0000 (Wed, 28 Jan 2009)
 laird> New Revision: 25102

 laird> Log:
 laird> autoconf.mk: Bounce version to 2.63

 laird> Have been having various issues with multiple jobs (-jX) and building
 laird> autoconf.  Turns out that v2.63 has fixed this.  So bounce version
 laird> to a working version.

Ok, let's give it a good shake to see if anything breaks with this.

-- 
Bye, Peter Korsgaard
