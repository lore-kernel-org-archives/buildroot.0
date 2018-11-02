From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 10:16:51 +0000
Subject: [Buildroot] [Bug 11156] In python3 module 'socket' has no attribute
 'AF_BLUETOOTH'
In-Reply-To: <bug-11156-163@https.bugs.busybox.net/>
References: <bug-11156-163@https.bugs.busybox.net/>
Message-ID: <bug-11156-163-i4cnQIlk2O@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11156

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/bluez5_utils-headers?id=9edd1760edcfb8bd5cc49043e79893c60e19c0e0
and
https://git.buildroot.org/buildroot/commit/package/python3?id=cd30ed51b46edff512d84cc5ae038a55c7129860.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
