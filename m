From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2012 14:43:52 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] Qt 4.7.4 build crashes with Linux 2.6.29
In-Reply-To: <bug-4958-163@https.bugs.busybox.net/>
References: <bug-4958-163@https.bugs.busybox.net/>
Message-ID: <20120321144352.B7D1095415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

--- Comment #3 from J?r?mie Scheer <jeremie.scheer@armadeus.com> 2012-03-21 14:43:52 UTC ---
Thank you for your answer. In fact, that's not really a Buildroot problem.
But I found a patch for uClibc that omits accept4 when the kernel version is
too old to support it.

If that can be of any help, I attached this patch to the bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
