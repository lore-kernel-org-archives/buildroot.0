From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Apr 2016 21:18:07 +0000
Subject: [Buildroot] [Bug 8861] With buildroot 2016.02 trying to build for
 corei7-avx fails while trying to build host-binutils.
In-Reply-To: <bug-8861-163@https.bugs.busybox.net/>
References: <bug-8861-163@https.bugs.busybox.net/>
Message-ID: <bug-8861-163-cYuexxzv0E@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8861

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.net/buildroot/commit/arch?id=633f20002e4184e91ead8599fcc557e9fd17e1e0.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
