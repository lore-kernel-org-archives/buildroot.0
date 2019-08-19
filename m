From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Aug 2019 21:10:24 +0000
Subject: [Buildroot] [Bug 12126] vc4 has neon as hard dependency
In-Reply-To: <bug-12126-163@https.bugs.busybox.net/>
References: <bug-12126-163@https.bugs.busybox.net/>
Message-ID: <bug-12126-163-S2VcuHRkOv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12126

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=350cb0d32ece533b9723a5f3ca6fbf7e6f071c90.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
