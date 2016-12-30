From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:13:06 +0000
Subject: [Buildroot] [Bug 9551] Coreutils fails to build target
 src/src_libsinglebin_pinky_a-pinky.o
In-Reply-To: <bug-9551-163@https.bugs.busybox.net/>
References: <bug-9551-163@https.bugs.busybox.net/>
Message-ID: <bug-9551-163-WwtjTgmWwU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9551

--- Comment #2 from bilge at scriptfusion.com ---
Hi Yann,

Thanks, I believe your analysis is exactly correct: I am missing utmpx, but not
because I deliberately disabled it; that feature is disabled by default in
uClibc 1.0.9. However, I'll be sure to enable it now!

Thanks,
Bilge.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
