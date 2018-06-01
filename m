From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 01 Jun 2018 19:54:53 +0000
Subject: [Buildroot] [Bug 11051] runtime issue on STM32 with usage of
 binutils 2.29.x
In-Reply-To: <bug-11051-163@https.bugs.busybox.net/>
References: <bug-11051-163@https.bugs.busybox.net/>
Message-ID: <bug-11051-163-Bw4a2jgrpl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11051

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by making ARM thumb builds default to binutils 2.28.x and display a
warning message in the Linux config:

https://git.buildroot.org/buildroot/commit/?id=17f352acdebd4a825903807f8a2d60ebea223afb
https://git.buildroot.org/buildroot/commit/?id=3dbc5a62798d0f804a9a931b5dbd1c3a2a419ab2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
