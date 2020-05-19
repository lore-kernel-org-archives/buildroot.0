From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 May 2020 21:40:27 +0000
Subject: [Buildroot] [Bug 12321] host-generic-package: PKG_DL_OPTS not used
 for host package
In-Reply-To: <bug-12321-163@https.bugs.busybox.net/>
References: <bug-12321-163@https.bugs.busybox.net/>
Message-ID: <bug-12321-163-tFfAfGH0Xr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12321

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Fixed in
https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=085f32c17b408fbac68d92232b42d49e883e1f69.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
