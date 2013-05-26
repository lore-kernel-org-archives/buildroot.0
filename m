From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 14:29:21 +0000 (UTC)
Subject: [Buildroot] [Bug 6014] Building rootfs stops at copying device
 table when not using static tables
In-Reply-To: <bug-6014-163@https.bugs.busybox.net/>
References: <bug-6014-163@https.bugs.busybox.net/>
Message-ID: <20130526142921.B80C79A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6014

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> 2013-05-26 14:28:12 UTC ---
Works for me. Can you give us a failing defconfig? On which filesystem does it
fail?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
