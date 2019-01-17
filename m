From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Jan 2019 22:14:15 +0000
Subject: [Buildroot] [Bug 11546] open-vm-tools with glibc 2.28
In-Reply-To: <bug-11546-163@https.bugs.busybox.net/>
References: <bug-11546-163@https.bugs.busybox.net/>
Message-ID: <bug-11546-163-KDTYIkgUhW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11546

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=5f0f0f7e4f3362a3695d5876d0f41125a2544285
- Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
