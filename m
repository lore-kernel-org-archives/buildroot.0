From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Jul 2020 07:27:20 +0000
Subject: [Buildroot] [Bug 13026] rpi-firmware: must not rename start files
In-Reply-To: <bug-13026-163@https.bugs.busybox.net/>
References: <bug-13026-163@https.bugs.busybox.net/>
Message-ID: <bug-13026-163-CYIMja9FOp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13026

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=72bf704f0313b314bc52dbebfd2b2e62d4fed5b3,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
