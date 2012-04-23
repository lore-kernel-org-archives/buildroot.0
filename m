From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Apr 2012 21:54:59 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] Qt 4.7.4 build crashes with Linux 2.6.29
In-Reply-To: <bug-4958-163@https.bugs.busybox.net/>
References: <bug-4958-163@https.bugs.busybox.net/>
Message-ID: <20120423215459.EE3A596B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-04-23 21:54:59 UTC ---
Not a Buildroot bug per se: 2.6.29 is old now, and many userspace components
depend on system calls that have been added since then, and therefore recent
enough kernel headers are needed to build several userspace packages (qt, udev,
etc.)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
