From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 13:31:05 +0000 (UTC)
Subject: [Buildroot] [Bug 6014] Building rootfs stops at copying device
 table when not using static tables
In-Reply-To: <bug-6014-163@https.bugs.busybox.net/>
References: <bug-6014-163@https.bugs.busybox.net/>
Message-ID: <20130526133105.BC77D9A38D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6014

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |arnout at mind.be
                   |.org                        |

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 13:29:56 UTC ---
Arnout, since you're the author of 847895d29524d81b64afb059b8649a77802a469b,
could you have a look at the below bug? Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
