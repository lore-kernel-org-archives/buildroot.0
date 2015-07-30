From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:12:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7742] dhcp lacks important features when
	BR2_ENABLE_DEBUG
In-Reply-To: <bug-7742-163@https.bugs.busybox.net/>
References: <bug-7742-163@https.bugs.busybox.net/>
Message-ID: <20150730101208.3E0BE81E69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7742

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:12:08 UTC ---
We are no longer passing --enable-debug to all packages when BR2_ENABLE_DEBUG=y
since commit
http://git.buildroot.net/buildroot/commit/package/Makefile.in?id=0552a367dbdc27a211daaac3359d81dd537e384f.
Therefore, this bug is fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
