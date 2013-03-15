From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Mar 2013 14:56:08 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20130315145608.181F39B112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-03-15 14:56:49 UTC ---
Thanks a lot for the great investigation! Can you try the patch at
http://free-electrons.com/~thomas/pub/0001-grub-bump-to-0.97-67.patch ?

I think it should fix the gcc 4.6 problem. The patch simply bumps the Grub
version we use to a slightly more recent Debian patch version, which precisely
includes a gcc 4.6 related fix.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
