From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Sep 2018 21:36:17 +0000
Subject: [Buildroot] [Bug 11286] python-rpi-gpio only should depend on
 BR2_arm || BR2_aarch64
In-Reply-To: <bug-11286-163@https.bugs.busybox.net/>
References: <bug-11286-163@https.bugs.busybox.net/>
Message-ID: <bug-11286-163-mrmLAdAeMK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11286

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
So, in other words, upstream never tested/supported using on AArch64 it seems,
so there is no point in enabling this package on AArch64 in Buildroot at the
moment. So, I'll mark the bug as INVALID. You can take this up with the
upstream project, and then update the package in Buildroot. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
