From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Apr 2010 16:46:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100409164629.469B220822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213


Will Wagner <will_wagner@carallon.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
Attachment #1459 is|0                           |1
           obsolete|                            |




--- Comment #7 from Will Wagner <will_wagner@carallon.com>  2010-04-09 16:46:28 UTC ---
Created an attachment (id=1495)
 --> (https://bugs.busybox.net/attachment.cgi?id=1495)
Fixed missed renames

Your right, I missed a case. I also noticed I managed to build .auto.deps wrong
(although I still think no one ever uses it).

Please try this patch out, hopefully all done now.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
