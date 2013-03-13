From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Mar 2013 19:02:10 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20130313190210.A75EB9B080@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

--- Comment #2 from gfx229-uclibc at yahoo.com 2013-03-13 19:02:54 UTC ---
Additional information - I hand-built an ISO using the stage2_eltorito bits
built from my 2012.08 build and the resulting ISO is bootable. So I imagine
there's something amiss with the grub-0.97 bits between now and then that are
contributing to my hang.  Will continue to investigate as time permits.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
