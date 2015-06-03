From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:29:53 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20150603012953.4299181E15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:29:53 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/package/gcc?id=19d5953bf15b9e68d083fc72bcd40b02b7ab810a.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
