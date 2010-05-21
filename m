From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 23:03:59 +0000 (UTC)
Subject: [Buildroot] [Bug 699] Buildroot fails to copy libstdc++ to target
 when using external toolchain
In-Reply-To: <bug-699-163@https.bugs.busybox.net/>
References: <bug-699-163@https.bugs.busybox.net/>
Message-ID: <20100521230359.460217FD58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=699

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Fixed by ea2505ee567f716f6b2aeae45ccfe2555c0bcb97 : we now look for libraries
in both lib/ and usr/lib in the external toolchain sysroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
