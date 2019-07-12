From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Jul 2019 19:33:22 +0000
Subject: [Buildroot] [Bug 11991] [numpy] segfault when compiling for RPi3
 64bits
In-Reply-To: <bug-11991-163@https.bugs.busybox.net/>
References: <bug-11991-163@https.bugs.busybox.net/>
Message-ID: <bug-11991-163-ZRdSzdu1wI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11991

--- Comment #5 from Peter Seiderer <ps.report@gmx.net> ---
Update:

- gcc 5.x (works)
- gcc 6.x (numpy segfault)

Yes, gcc-9.1 support was added already on git master (see [1]) and will land in
the next buildroot release...

[1]
https://git.buildroot.net/buildroot/commit/?id=089000eccf584d611ad1a8e5400436952450e883

-- 
You are receiving this mail because:
You are on the CC list for the bug.
