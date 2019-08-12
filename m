From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2019 20:40:51 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-8GfxQGSeqA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks Carlos for taking care of the issue. It certainly makes sense to use the
devmem applet from Busybox, when Busybox is enabled.

However, I'm wondering if it makes sense to keep a standalone version of this
program. Most (all?) applets provided by Busybox also have a counterpart
"full-blown" version, which can be useful in situations where Busybox is not
used.

Overall, it feels like this bug is not really a Buildroot bug: it's an upstream
devmem2 bug, which should be reported to upstream and not to Buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
