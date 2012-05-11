From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 May 2012 11:01:57 +0200
Subject: [Buildroot] [PATCH] gpsd: Add package version to libgpsmm patch
In-Reply-To: <4FACD316.9050907@imgtec.com>
References: <1333628924-8966-1-git-send-email-markos.chandras@imgtec.com>
 <20120511104341.33990e92@skate> <4FACD316.9050907@imgtec.com>
Message-ID: <20120511110157.750f092d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 11 May 2012 09:51:34 +0100,
Markos Chandras <Markos.Chandras@imgtec.com> a ?crit :

> Ok I didn't know what the preferred way of fixing this problem was. I
> will prepare a new patch then.

Yeah, we haven't made it explicit yet by changing the patching logic,
but we have decided at the last Buildroot Developer meeting to do the
following:

"""
---------------------------------------------------------------------

7. Infrastructure for applying patches, i.e. how should patches be
named

---------------------------------------------------------------------

Non-versioned patches
    package/foo/<seqnum>-*.patch
Versioned patches
    package/foo/version/<seqnum>-*.patch

Patches are either versioned, or they are not. Versioned patches
should only be created for packages that have multiple supported
versions.
"""

This was part of the Developer meeting report sent to the list by
Arnout on February, 16th 2012.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
