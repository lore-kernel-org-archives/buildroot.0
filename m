From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 09:35:21 +0100
Subject: [Buildroot] svn commit: [25692] trunk/buildroot/package/expat
In-Reply-To: <COL102-DS2253298296A264E169E897DC980@phx.gbl> (Daniel Laird's
	message of "Tue\, 17 Mar 2009 08\:29\:43 +0000")
References: <20090316205805.701717649F@busybox.osuosl.org>
	<COL102-DS2253298296A264E169E897DC980@phx.gbl>
Message-ID: <87tz5so8c6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <danieljlaird@hotmail.com> writes:

 Daniel> Has the time come to have 2 libtool patches?
 Daniel> We could then sniff ltmain.sh and decide which patch to apply.

Well, that or handling the libtool stuff in a different way. Does
anyone know how it's done in openembedded / ptxdist / openwrt / t2 /
..?

The reason why we cannot use the libtool patch for expat is that it's
stored in a conftools sub directory.

 Daniel> I ask as I have locally had to add patches for a few packages
 Daniel> that all have newer libtool meaning the global patch does not
 Daniel> work.  Perhaps having 2 global patches and picking one would
 Daniel> remove a large number of the libdir-la.patch files (and it is
 Daniel> increasing)

Yes, I noticed the problem as well (most recently with avahi 0.6.24).

-- 
Bye, Peter Korsgaard
