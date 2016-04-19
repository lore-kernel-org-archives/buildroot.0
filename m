From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Apr 2016 21:40:01 +0000
Subject: [Buildroot] [Bug 8851] Make sure fio can compile with libaio
 support if it the package is installed
In-Reply-To: <bug-8851-163@https.bugs.busybox.net/>
References: <bug-8851-163@https.bugs.busybox.net/>
Message-ID: <bug-8851-163-gJYWy0M7uJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8851

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.net/buildroot/commit/?id=71122f537d2ff93f206818c8d91e06f55fe2b5e2,
thanks for your suggestion!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
