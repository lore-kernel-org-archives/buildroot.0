From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Oct 2010 06:10:01 +0000 (UTC)
Subject: [Buildroot] [Bug 2557] [PATCH] mkfs.xfs complains about missing
	libxfs.so.0
In-Reply-To: <bug-2557-163@https.bugs.busybox.net/>
References: <bug-2557-163@https.bugs.busybox.net/>
Message-ID: <20101008061001.3A0388B8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2557

Ossy <marcus.osdoba@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #2455|0                           |1
        is obsolete|                            |

--- Comment #3 from Ossy <marcus.osdoba@googlemail.com>  ---
Comment on attachment 2455
  --> https://bugs.busybox.net/attachment.cgi?id=2455
Fixes missing libs with xfsprogs

newer patch uses higher version and converts to autotargets

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
