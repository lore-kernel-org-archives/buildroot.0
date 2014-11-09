From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 10:54:30 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] Buildroot GCC: -lto requires plugin support
	in ranlib
In-Reply-To: <bug-7592-163@https.bugs.busybox.net/>
References: <bug-7592-163@https.bugs.busybox.net/>
Message-ID: <20141109105430.D8CC0A86E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

--- Comment #2 from syntheticpp at gmx.net 2014-11-09 10:54:30 UTC ---
OK, I build gcc and binutils with

+        --enable-plugins \
+        --enable-lto

rootfs builds fine, but when gcc-ar is called it fails because it is also
called with all the GCC options.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
