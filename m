From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 18:59:08 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-kA5nHFgVSc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #5 from Ivan <ivan.nazarenko@gmail.com> ---
Anyway it seems that gcc7.1 is still a bit buggy. I could not finish the build
of qt5base with it - and the issue was not that "crc" of the other bug report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
