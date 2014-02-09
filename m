From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Feb 2014 21:23:36 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] Make sure that copied linux and busybox
 defconfig are writable before modifying
In-Reply-To: <bug-4363-163@https.bugs.busybox.net/>
References: <bug-4363-163@https.bugs.busybox.net/>
Message-ID: <20140209212336.CA9B69A547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> 2014-02-09 21:23:35 UTC ---
Fixed by Yann in git (984524fda1f8260e258421f6676d522591f025da and parents)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
