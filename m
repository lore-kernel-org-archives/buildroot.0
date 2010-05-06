From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 21:04:18 +0000 (UTC)
Subject: [Buildroot] [Bug 1699] Fix usbutils dependencies and bump
In-Reply-To: <bug-1699-163@https.bugs.busybox.net/>
References: <bug-1699-163@https.bugs.busybox.net/>
Message-ID: <20100506210418.5074D7F921@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1699

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks. Notice that we have BR2_KERNEL_MIRROR for kernel.org
mirrors.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
