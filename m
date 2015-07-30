From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:08:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7946] libglib2-2.42.2 fails to build for
 sparc-buildroot-linux-gnu
In-Reply-To: <bug-7946-163@https.bugs.busybox.net/>
References: <bug-7946-163@https.bugs.busybox.net/>
Message-ID: <20150730100821.DD3BD80587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7946

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:08:21 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/package/libglib2?id=e4a707e79838680984cd4bb25b5a9959fc44ddc8.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
