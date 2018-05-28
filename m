From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 May 2018 20:58:45 +0000
Subject: [Buildroot] [Bug 11031] ld-elf2flt: host/bin/ld.real': execvp: No
 such file or directory
In-Reply-To: <bug-11031-163@https.bugs.busybox.net/>
References: <bug-11031-163@https.bugs.busybox.net/>
Message-ID: <bug-11031-163-OOxTWNB5GR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11031

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by:
https://git.buildroot.org/buildroot/commit/?id=bb0164a8b191e5cbf656a4a6b4c5491d4fc167b6

and

https://git.buildroot.org/buildroot/commit/?id=b37069340010f4d26c3baa741f2dc996014b7c66

-- 
You are receiving this mail because:
You are on the CC list for the bug.
