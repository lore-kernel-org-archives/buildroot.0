From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jul 2016 19:07:19 +0000
Subject: [Buildroot] [Bug 9086] Syntax Error (missing ")" in
 boot/uboot/uboot.mk on line 203)
In-Reply-To: <bug-9086-163@https.bugs.busybox.net/>
References: <bug-9086-163@https.bugs.busybox.net/>
Message-ID: <bug-9086-163-pSNnB48RfN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9086

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks a lot for reporting the problem, I fixed it in
https://git.buildroot.org/buildroot/commit/?id=61c26cc8170e187ab6aa4175630fb6c9bfaf0a14.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
