From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 21:27:12 +0000
Subject: [Buildroot] [Bug 10471] Building a mipsel kernel format vmlinuz (+
 gzip + initrd) generates non-compressed, non-bootable image
In-Reply-To: <bug-10471-163@https.bugs.busybox.net/>
References: <bug-10471-163@https.bugs.busybox.net/>
Message-ID: <bug-10471-163-0NH1EQUgSx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10471

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The original contributor never came back with a way to reproduce the problem
with a reasonable kernel version (i.e not the Broadcom BSP), so let's mark  the
bug as WONTFIX.

Do not hesitate to reopen with an easier way to reproduce the problem. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
