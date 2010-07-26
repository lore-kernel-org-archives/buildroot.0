From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jul 2010 14:13:52 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100726141352.67E7A834A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc |thomas.petazzoni at free-elect
                   |.org                        |rons.com
   Target Milestone|---                         |2010.08

--- Comment #15 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, I managed to reproduce the issue, and I have a fix currently being tested
for it. Should hopefully be merged before 2010.08.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
