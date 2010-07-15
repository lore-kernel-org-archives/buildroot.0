From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Jul 2010 09:31:03 +0000 (UTC)
Subject: [Buildroot] [Bug 361] linux kernel configuration choice works
	incorrectly
In-Reply-To: <bug-361-163@https.bugs.busybox.net/>
References: <bug-361-163@https.bugs.busybox.net/>
Message-ID: <20100715093103.B4B8882A59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=361

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The bug report explanations aren't detailed enough to fully understand the
issue, but it's quite likely that it has been fixed by the merge of the
linux-cleanup work, which has completely rewritten the Linux kernel support in
BR.

Therefore, I'll mark this bug as fixed. If the new linux-cleanup work still has
a similar issue, feel free to reopen it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
