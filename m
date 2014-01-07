From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jan 2014 07:37:43 +0000 (UTC)
Subject: [Buildroot] [Bug 5810] Buildroot 2012.11: Additional GCC option
 "-msoft-float" breaks the build
In-Reply-To: <bug-5810-163@https.bugs.busybox.net/>
References: <bug-5810-163@https.bugs.busybox.net/>
Message-ID: <20140107073743.C71D49C3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5810

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-01-07 07:37:43 UTC ---
The ARM soft-float / hard-float support has been significantly improved in the
2013.08 release. There is now a clear way of choosing between soft-float,
hard-float with floating point arguments passed in integer registers (so-called
softfp) and hard-float with floating point arguments passed in floating point
registers (so called hardfp).

Therefore, I believe this bug can now be considered as fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
