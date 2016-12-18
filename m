From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Dec 2016 13:26:33 +0000
Subject: [Buildroot] [Bug 9486] xorg-server 1.19 fails to compile for glibc
 with systemd init (x86_64)
In-Reply-To: <bug-9486-163@https.bugs.busybox.net/>
References: <bug-9486-163@https.bugs.busybox.net/>
Message-ID: <bug-9486-163-ZrNzf5YidV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9486

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=cd4af31dd86c475482770f9ce9ccb583485c6449

-- 
You are receiving this mail because:
You are on the CC list for the bug.
