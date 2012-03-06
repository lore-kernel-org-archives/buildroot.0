From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Mar 2012 20:03:24 +0000 (UTC)
Subject: [Buildroot] [Bug 4868] Buildroot compile failure for
 toolchain/gdb-7.4/intl/relocatable.c
In-Reply-To: <bug-4868-163@https.bugs.busybox.net/>
References: <bug-4868-163@https.bugs.busybox.net/>
Message-ID: <20120306200324.2CDD890D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4868

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #4088|0                           |1
        is obsolete|                            |

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> 2012-03-06 20:03:24 UTC ---
Created attachment 4094
  --> https://bugs.busybox.net/attachment.cgi?id=4094
Fix gdb-7.4 intl relocatable.c compile failure.

Fix typo on patch (relocation vs. relocatable).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
