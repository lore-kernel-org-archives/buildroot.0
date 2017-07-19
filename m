From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jul 2017 20:26:06 +0000
Subject: [Buildroot] [Bug 9916] qt5 does not build on
 arm-buildroot-linux-uclibcgnueabihf for ARMv8 cores
In-Reply-To: <bug-9916-163@https.bugs.busybox.net/>
References: <bug-9916-163@https.bugs.busybox.net/>
Message-ID: <bug-9916-163-NUe9fcDmi7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9916

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/binutils?id=d558ca17138331b1f3a9d780ced07671e0f0a185
and
https://git.buildroot.org/buildroot/commit/package/qt5?id=a9e053b5a8b4195aaddd97db98b0ba3dcf788638.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
