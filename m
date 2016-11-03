From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Nov 2016 20:45:25 +0000
Subject: [Buildroot] [Bug 9111] glibc 2.23: libmvec.so not copied
In-Reply-To: <bug-9111-163@https.bugs.busybox.net/>
References: <bug-9111-163@https.bugs.busybox.net/>
Message-ID: <bug-9111-163-COq3zcsMBA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9111

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Patches have been merged:
https://git.buildroot.org/buildroot/commit/package/glibc?id=2c877590b3b18df4853989a66378c184713ccd55
and
https://git.buildroot.org/buildroot/commit/toolchain/toolchain-external?id=447e9051f32936a3a185af926c7ec394cbd61962.
Therefore, the bug is fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
