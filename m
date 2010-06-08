From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jun 2010 16:50:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1927] Bump file to 5.03 and migrate to autotargets
In-Reply-To: <bug-1927-163@https.bugs.busybox.net/>
References: <bug-1927-163@https.bugs.busybox.net/>
Message-ID: <20100608165029.504DC857AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1927

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #1915|0                           |1
        is obsolete|                            |

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Created attachment 1975
  --> https://bugs.busybox.net/attachment.cgi?id=1975
Bump file to 5.04 and migrate to autotargets

It seems file uses file to build its magic file and also that minor version
bumps may make the magic source incompatible (thus my case of running host 5.03
on my distro not liking to build 5.04 for BR).
So yeah, we need host-file.
Fixed, try it now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
