From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Aug 2019 21:08:37 +0000
Subject: [Buildroot] [Bug 11741] pigpio does not build host-pigpio.
In-Reply-To: <bug-11741-163@https.bugs.busybox.net/>
References: <bug-11741-163@https.bugs.busybox.net/>
Message-ID: <bug-11741-163-i7eq6wGCyE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11741

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=589b8cb7e2d81067fde9ee4f11acecf8fd677dde.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
