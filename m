From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Jan 2018 08:34:18 +0000
Subject: [Buildroot] [Bug 10556] Building ntp package with SSL library
 libressl instead of openssl fails
In-Reply-To: <bug-10556-163@https.bugs.busybox.net/>
References: <bug-10556-163@https.bugs.busybox.net/>
Message-ID: <bug-10556-163-dQIN2QFQaB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10556

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks, fixed by:
https://git.buildroot.org/buildroot/commit/?id=522111f81c7d535f4f362ad4a15d141d0eb39ec5

-- 
You are receiving this mail because:
You are on the CC list for the bug.
