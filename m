From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 14 Oct 2018 19:14:24 +0000
Subject: [Buildroot] [Bug 11396] uboot environment image checksum invalid if
 target is big endian
In-Reply-To: <bug-11396-163@https.bugs.busybox.net/>
References: <bug-11396-163@https.bugs.busybox.net/>
Message-ID: <bug-11396-163-gNNIkGAA96@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11396

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report and fix! Applied in
https://git.buildroot.org/buildroot/commit/?id=d6fcf044a747284df4eddaf106082ebb571976b3.

Next time, you could also just send a patch to the mailing list, so that we can
easily preserve your authorship. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
