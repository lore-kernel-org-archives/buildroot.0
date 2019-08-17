From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Aug 2019 21:51:18 +0000
Subject: [Buildroot] [Bug 11921] dahdi fails to build
In-Reply-To: <bug-11921-163@https.bugs.busybox.net/>
References: <bug-11921-163@https.bugs.busybox.net/>
Message-ID: <bug-11921-163-z6v7t69iAF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11921

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=790c9ca0923e575a3326b6cb14a4eb410352c6c9.
Thanks! I tested, it builds fine with Linux 4.19. It does not build fine with
Linux 5.2 though, but it's an upstream dahdi-linux issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
