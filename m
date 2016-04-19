From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Apr 2016 21:32:35 +0000
Subject: [Buildroot] [Bug 8801] Compilation of Buildroot 2016.2 for
 Raspberry Pi with Musl 1.1.6 fails - no stddef.h header
In-Reply-To: <bug-8801-163@https.bugs.busybox.net/>
References: <bug-8801-163@https.bugs.busybox.net/>
Message-ID: <bug-8801-163-gJnFEVicWu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8801

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This really is a bug in the Raspberry Pi kernel, so you should report it
upstream at https://github.com/raspberrypi/linux/issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
