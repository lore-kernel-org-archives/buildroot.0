From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Jul 2017 01:54:29 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-MaU72FSVDs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #9 from Ivan <ivan.nazarenko@gmail.com> ---
but verifying against the output produced when using gcc6.x, I see it invoking
the same apparent system compiler, and yet everything works fine. So somehow it
is actually invoking the arm cross-compiler and I just do not understand how.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
