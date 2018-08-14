From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Aug 2018 21:20:23 +0000
Subject: [Buildroot] [Bug 11191] xattr and check-package issue
In-Reply-To: <bug-11191-163@https.bugs.busybox.net/>
References: <bug-11191-163@https.bugs.busybox.net/>
Message-ID: <bug-11191-163-klQdq9hfZA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11191

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Ricardo Martincoski from comment #1)

In addition to Ricardo's suggestions, here's I believe the
technically simplest solution:

5) Require the _PERMISSIONS to not be indented at all.

But I believe hat Ricardo's #3 is the best solution.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
