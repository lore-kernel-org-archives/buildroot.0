From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Jul 2019 20:25:55 +0000
Subject: [Buildroot] [Bug 11991] [numpy] segfault when compiling for RPi3
 64bits
In-Reply-To: <bug-11991-163@https.bugs.busybox.net/>
References: <bug-11991-163@https.bugs.busybox.net/>
Message-ID: <bug-11991-163-YQHmlx55uz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11991

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
Thanks for the info/config...

With make menuconfig under Toolchain-->GCC compiler Version you
can select different versions, e.g.

- gcc 4.9.x (works)
- gcc 5.x (untested)
- gcc 6.x (untested)
- gcc 7.x (your/default selection, numpy segfault)
- gcc 8.x (numpy segfault)

Or in case you use buildroot master from git

- gcc 9.x (works)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
