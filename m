From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 13:51:29 +0000
Subject: [Buildroot] [Bug 13081] host-e2fsprogs attempts to create udev
 rules.d on build host if not exists
In-Reply-To: <bug-13081-163@https.bugs.busybox.net/>
References: <bug-13081-163@https.bugs.busybox.net/>
Message-ID: <bug-13081-163-HWqinzKTMs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13081

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
This is fixed by
https://git.buildroot.org/buildroot/commit/?id=ea6ddd367140f38bb512cf35de9f84d0ac853cff

-- 
You are receiving this mail because:
You are on the CC list for the bug.
