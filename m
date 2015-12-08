From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Dec 2015 16:27:57 +0000
Subject: [Buildroot] [Bug 4099] cut utility from GNU coreutils works
	incorrect
In-Reply-To: <bug-4099-163@https.bugs.busybox.net/>
References: <bug-4099-163@https.bugs.busybox.net/>
Message-ID: <bug-4099-163-mRM7JdcuEL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4099

--- Comment #6 from P?draig Brady <P@draigBrady.com> ---
A couple of points.

This gnulib code is quite the layering violation,
which results in issues like these.

It's always worth reporting GNU coreutils bugs to
bug-coreutils at gnu.org

The change to uClibc config is a fine workaround,
especially since it will generally speedup operations,
though the actual fix is probably the following in gnulib:
http://lists.gnu.org/archive/html/bug-gnulib/2015-12/msg00003.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
