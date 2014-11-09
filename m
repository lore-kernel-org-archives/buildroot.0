From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 12:14:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] Buildroot GCC: -lto requires plugin support
	in ranlib
In-Reply-To: <bug-7592-163@https.bugs.busybox.net/>
References: <bug-7592-163@https.bugs.busybox.net/>
Message-ID: <20141109121418.341D4B1670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

--- Comment #4 from syntheticpp at gmx.net 2014-11-09 12:14:18 UTC ---
I pushed patches to the list to support lto for buildroot-clients.
buildroot itself is still compiled without lto.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
