From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 May 2017 14:04:02 +0000
Subject: [Buildroot] [Bug 9806] libseccomp is not available when BR2_arm=y
In-Reply-To: <bug-9806-163@https.bugs.busybox.net/>
References: <bug-9806-163@https.bugs.busybox.net/>
Message-ID: <bug-9806-163-ukbW2qDjpL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9806

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=bd2c2329c534dd45d2b269c26fb630aaa761b1d4.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
