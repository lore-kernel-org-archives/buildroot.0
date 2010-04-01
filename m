From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Apr 2010 16:04:30 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100401160430.264D47F90E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213


Will Wagner <will_wagner@carallon.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
Attachment #1177 is|0                           |1
           obsolete|                            |




--- Comment #3 from Will Wagner <will_wagner@carallon.com>  2010-04-01 16:04:29 UTC ---
Created an attachment (id=1453)
 --> (https://bugs.busybox.net/attachment.cgi?id=1453)
Revised patch following feedback

Have updated the patch to fix both the issues.

Change to have .config files in buildroot dir id O= not specified was simple.

Modifying config to put temp files in O= folder was relatively straight
forward, although obviously it is straying quite a long way from the original
kernel source.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
