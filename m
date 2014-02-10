From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Feb 2014 17:59:11 +0000 (UTC)
Subject: [Buildroot] [Bug 4454] There should be simple way to update image,
 when changing external fs skeleton
In-Reply-To: <bug-4454-163@https.bugs.busybox.net/>
References: <bug-4454-163@https.bugs.busybox.net/>
Message-ID: <20140210175911.EA0BD9C94A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4454

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-10 17:59:11 UTC ---
Other buildroot developers agree that this patch is very project specific and
should not be applied to mainline buildroot.

Please consider using a post-build script or rootfs overlay to achieve the same
effect (instead of changing files directly in the (custom) skeleton). See the
buildroot manual for more information:
http://buildroot.uclibc.org/downloads/manual/manual.html#_customization

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
