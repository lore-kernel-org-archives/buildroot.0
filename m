From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Jul 2017 09:32:06 +0000
Subject: [Buildroot] [Bug 10061] gcc5.4 buildroot toolchain for powerpc
 libsanitizer failure
In-Reply-To: <bug-10061-163@https.bugs.busybox.net/>
References: <bug-10061-163@https.bugs.busybox.net/>
Message-ID: <bug-10061-163-QrcP7M7lhd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10061

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by your own patch, applied as of commit
https://git.buildroot.org/buildroot/commit/?id=5c90f6a7b68ebdc43ea72b763ec98a0a300c57a1.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
