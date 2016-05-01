From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 May 2016 20:30:58 +0000
Subject: [Buildroot] [Bug 8866] Making an USB flash bootable with extlinux
 build with buildroot does not work.
In-Reply-To: <bug-8866-163@https.bugs.busybox.net/>
References: <bug-8866-163@https.bugs.busybox.net/>
Message-ID: <bug-8866-163-0u4hDeN7MX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8866

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Should be fixed by
https://git.busybox.net/buildroot/commit/?id=2512fcf41f402f7bd7aa27db17a91a00e079f881.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
