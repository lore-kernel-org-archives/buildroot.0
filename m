From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2012 14:18:31 +0000 (UTC)
Subject: [Buildroot] [Bug 3631] Error while compiling with Xorg
In-Reply-To: <bug-3631-163@https.bugs.busybox.net/>
References: <bug-3631-163@https.bugs.busybox.net/>
Message-ID: <20121022141831.D4791998E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3631

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-10-22 14:18:30 UTC ---
Here, xdriver_xf86-video-fbdev-0.4.2 builds just fine. It selects the
xorg-xserver package, so it should be built as a dependency correctly.

Can you please post your Buildroot .config file as you suggested, and confirm
that you can reproduce this problem from a completely clean Buildroot build
(i.e after running "make clean; make") ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
