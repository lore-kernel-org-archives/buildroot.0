From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 20:21:29 +0000 (UTC)
Subject: [Buildroot] [Bug 8501] gunzip fails to uncompress files
In-Reply-To: <bug-8501-163@https.bugs.busybox.net/>
References: <bug-8501-163@https.bugs.busybox.net/>
Message-ID: <20151201202129.AB46E80096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8501

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |arnout at mind.be
                   |.org                        |

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> 2015-12-01 20:21:29 UTC ---
That's due to 0002-unzip.patch; upstream has got an additional fix in
6bd3fff51aa74e2ee2d87887b12182a3b09792ef. I'll add it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
