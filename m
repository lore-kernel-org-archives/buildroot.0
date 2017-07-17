From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 14:26:13 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-K25JM3uRgX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

Ivan <ivan.nazarenko@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |minor

--- Comment #1 from Ivan <ivan.nazarenko@gmail.com> ---
graphite support in gcc7.1 demands isl 0.15 or newer.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
