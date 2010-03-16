From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 20:33:31 +0000 (UTC)
Subject: [Buildroot] [Bug 1327] mtd-utils compile failure due to lack of
 --sysroot in CFLAGS
In-Reply-To: <bug-1327-163@https.bugs.busybox.net/>
References: <bug-1327-163@https.bugs.busybox.net/>
Message-ID: <20100316203331.4F76A7769A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1327





--- Comment #1 from Grant Edwards <grant.b.edwards@gmail.com>  2010-03-16 20:33:30 UTC ---
Created an attachment (id=1303)
 --> (https://bugs.busybox.net/attachment.cgi?id=1303)
Patch to correctly set CFLAGS when building mtd utils for use on target


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
