From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Apr 2010 14:41:47 +0000 (UTC)
Subject: [Buildroot] [Bug 1093] [PATCH] Upgrade libusb to v1.0.3 and add new
 libusb-compat package for compatibility with old packages that expect the
 pre-1.0 API.
In-Reply-To: <bug-1093-163@https.bugs.busybox.net/>
References: <bug-1093-163@https.bugs.busybox.net/>
Message-ID: <20100409144147.34A6020BCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1093


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-04-09 14:41:46 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=e237c9935796445434a7888b9fe2aa84e3e7975a

Thanks!


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
