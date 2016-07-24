From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Jul 2016 20:44:43 +0000
Subject: [Buildroot] [Bug 9091] U-Boot fails to boot with large ramdisk
In-Reply-To: <bug-9091-163@https.bugs.busybox.net/>
References: <bug-9091-163@https.bugs.busybox.net/>
Message-ID: <bug-9091-163-rxX69AiRoI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9091

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by commit 4846700a1b51e7f2c48639dafdb5143ad8e9de41.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
