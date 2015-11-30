From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2015 08:35:47 +0000 (UTC)
Subject: [Buildroot] [Bug 8441] Invalid directory for X11 fonts in target
	(RPi2)
In-Reply-To: <bug-8441-163@https.bugs.busybox.net/>
References: <bug-8441-163@https.bugs.busybox.net/>
Message-ID: <20151130083547.144BE80117@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8441

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-30 08:35:46 UTC ---
This problem has been fixed in commit 07de512d25cac6f76f077c9c5bb1cb8484ed9803.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
