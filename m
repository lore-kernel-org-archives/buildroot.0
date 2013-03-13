From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Mar 2013 21:54:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20130313215438.139D59B076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

--- Comment #4 from gfx229-uclibc at yahoo.com 2013-03-13 21:55:21 UTC ---
FYI - I now believe this is a GCC versionitis issue per se.  Kicking my build
back to GCC 4.5.x (instead of 4.6.x as is the current default) restores the
bootability of the resulting bits.  I'm not sure how these newer compilers are
impacting the build of the Grub directory but I will ad this note as an
advisory at this point.  If you wish to close this as not a bug you wish to
track (but rather document for work-around status), please feel free.  Thanks
for your continued valued work.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
