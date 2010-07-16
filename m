From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jul 2010 21:48:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2221] Qt does not compile (dependencies not taken
 into account?)
In-Reply-To: <bug-2221-163@https.bugs.busybox.net/>
References: <bug-2221-163@https.bugs.busybox.net/>
Message-ID: <20100716214836.EBB7882A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2221

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I've handled the mysql part of the problem in the patch
http://lists.busybox.net/pipermail/buildroot/2010-July/036122.html, which is
part of a pull request I hope Peter will merge soon.

The DirectFB part of the problem remains to be fixed, though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
