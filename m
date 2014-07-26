From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Jul 2014 08:51:43 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] uClibc: undefined reference to
	`__GI___errno_location'
In-Reply-To: <bug-4021-163@https.bugs.busybox.net/>
References: <bug-4021-163@https.bugs.busybox.net/>
Message-ID: <20140726085143.EBDCF9D304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

mail at waldemar-brodkorb.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |

--- Comment #9 from mail at waldemar-brodkorb.de 2014-07-26 08:51:42 UTC ---
Hi,

tried with current master and the problem still exist.
Can you share your working environment data? (build system, gcc version,
binutils version)
Removing HIDDEN_JUMPTARGET still make it work.

best regards
 Waldemar

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
