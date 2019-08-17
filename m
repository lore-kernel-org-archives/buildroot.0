From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Aug 2019 12:48:44 +0000
Subject: [Buildroot] [Bug 11876] automount using host mount/umount
In-Reply-To: <bug-11876-163@https.bugs.busybox.net/>
References: <bug-11876-163@https.bugs.busybox.net/>
Message-ID: <bug-11876-163-pZOc1pdkgj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11876

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=8c89a3a9a1d591d151daed2c081376dbd512083b.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
