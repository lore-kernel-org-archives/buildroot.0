From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Feb 2014 17:56:42 +0000 (UTC)
Subject: [Buildroot] [Bug 3811] Added auto-mount for USB and SD Card (mdev)
	(for 2011.05)
In-Reply-To: <bug-3811-163@https.bugs.busybox.net/>
References: <bug-3811-163@https.bugs.busybox.net/>
Message-ID: <20140210175642.AC1059C94A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3811

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-10 17:56:42 UTC ---
Other buildroot developers agree that this patch is very project specific and
should not be applied to mainline buildroot.

Please consider using a post-build script or rootfs overlay to achieve the same
effect. See the buildroot manual for more information:
http://buildroot.uclibc.org/downloads/manual/manual.html#_customization

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
