From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Sep 2019 20:10:11 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-owv47o0o50@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=2b2579afebfc7a9b8a458af1f2d206101fbfa19c.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
