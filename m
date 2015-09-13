From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Sep 2015 12:02:35 +0000 (UTC)
Subject: [Buildroot] [Bug 8341] Getting EGL Error: Could not create the egl
 surface: error = 0x300b on RPI-2b board.
In-Reply-To: <bug-8341-163@https.bugs.busybox.net/>
References: <bug-8341-163@https.bugs.busybox.net/>
Message-ID: <20150913120235.1728281E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8341

--- Comment #2 from Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> 2015-09-13 12:02:34 UTC ---
Also, please indicate the RPi FW config.txt that you're using (can be the
default one provided by Buildroot).

The one in Buildroot has small values for the GPU memory sizes, which are not
enough for some video applications. Maybe these sizes should be increased in
Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
