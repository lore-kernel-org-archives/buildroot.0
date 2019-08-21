From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Aug 2019 15:55:32 +0000
Subject: [Buildroot] [Bug 11686] fbdev_drv.so: undefined symbol:
 shadowUpdatePackedWeak, xinit: giving up
In-Reply-To: <bug-11686-163@https.bugs.busybox.net/>
References: <bug-11686-163@https.bugs.busybox.net/>
Message-ID: <bug-11686-163-bF3mW99rXM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11686

--- Comment #2 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
This bug should be closed, I assume that
https://git.buildroot.net/buildroot/commit/package/x11r7/xdriver_xf86-video-fbdev?id=904750363141935dc6b1143aaa1de21742df474a
has fixed it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
