From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Dec 2009 23:54:47 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20091215235447.9F2AF777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803


rvpaasen <rvpaasen@t3i.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #845 is|0                           |1
           obsolete|                            |




--- Comment #4 from rvpaasen <rvpaasen@t3i.nl>  2009-12-15 23:54:45 UTC ---
Created an attachment (id=857)
 --> (https://bugs.busybox.net/attachment.cgi?id=857)
lua patch with -DLUA_USE_DLOPEN

Patch with -DLUA_USE_DLOPEN added.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
