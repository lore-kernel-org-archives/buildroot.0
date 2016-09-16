From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Sep 2016 06:32:35 +0000
Subject: [Buildroot] [Bug 9021] Kodi - Broken: Illegal instruction (core
	dumped)
In-Reply-To: <bug-9021-163@https.bugs.busybox.net/>
References: <bug-9021-163@https.bugs.busybox.net/>
Message-ID: <bug-9021-163-3dXomeL3YC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9021

lipkegu at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|NEEDINFO                    |FIXED

--- Comment #4 from lipkegu at gmail.com ---
(In reply to Thomas Petazzoni from comment #3)

As i Open the Issue (a few days later i checked buildroot out again and it was
fixed by a few patches related to Mips.

The Problem was the Python "PYC" stuff i enabled it and it worked like a charm.
In the Phase of the Crash there is no kodi.log because GDB was missing so it
doesnt gave me any related infos.

I can watch Movies, Music and see Pictures.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
