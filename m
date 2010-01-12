From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Jan 2010 12:41:58 +0000 (UTC)
Subject: [Buildroot] [Bug 841] Build error
In-Reply-To: <bug-841-163@https.bugs.busybox.net/>
References: <bug-841-163@https.bugs.busybox.net/>
Message-ID: <20100112124158.3E79A77729@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=841





--- Comment #1 from Will Wagner <will_wagner@carallon.com>  2010-01-12 12:41:57 UTC ---
Created an attachment (id=913)
 --> (https://bugs.busybox.net/attachment.cgi?id=913)
Remove sysv legacy functions

The problem here is the toolchain does not have sysv legacy support and mtd
utils is using deprecated bzero and bcopy

Attached patch fixes mtd utils.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
