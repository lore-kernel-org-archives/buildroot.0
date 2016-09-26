From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Sep 2016 20:22:36 +0000
Subject: [Buildroot] [Bug 9301] U-boot fails to build with default
 zynq_zed_defconfig configuration
In-Reply-To: <bug-9301-163@https.bugs.busybox.net/>
References: <bug-9301-163@https.bugs.busybox.net/>
Message-ID: <bug-9301-163-Q5sZqlEF9m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9301

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks for the report. We are currently discussing on the list about changing
the logic to explicitly pass 'all' as the make target to fix this and similar
issues:

http://lists.busybox.net/pipermail/buildroot/2016-September/172815.html

Can you verify that explicitly passing 'all' also fixes it for you? Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
