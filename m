From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Apr 2021 20:31:25 +0000
Subject: [Buildroot] [Bug 13721] c-stack.c:55:26: error: missing binary
 operator before token "("
In-Reply-To: <bug-13721-163@https.bugs.busybox.net/>
References: <bug-13721-163@https.bugs.busybox.net/>
Message-ID: <bug-13721-163-mjQL9ph0at@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13721

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=5a9504831f3fa1ef3be334036c93da30150fde55.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
