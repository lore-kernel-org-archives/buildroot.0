From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Apr 2018 10:16:49 +0000
Subject: [Buildroot] [Bug 10151] toolchain eclipse register : fails with a
 custom BR2_HOST_DIR
In-Reply-To: <bug-10151-163@https.bugs.busybox.net/>
References: <bug-10151-163@https.bugs.busybox.net/>
Message-ID: <bug-10151-163-OHje58G845@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10151

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by commit
https://git.buildroot.org/buildroot/commit/Makefile?id=91b4a4525bf30a03c1f2542b3c4d340e5e4ca42a.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
