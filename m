From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Apr 2009 10:25:35 +0000 (UTC)
Subject: [Buildroot] [Bug 285] compilation of samba fails if IPV6 support is
	missing
In-Reply-To: <bug-285-163@https.bugs.busybox.net/>
References: <bug-285-163@https.bugs.busybox.net/>
Message-ID: <20090420102535.2FD94771E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=285


Sven Neumann <s.neumann@phase-zero.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #243 is|0                           |1
           obsolete|                            |




--- Comment #1 from Sven Neumann <s.neumann@phase-zero.de>  2009-04-20 10:25:34 UTC ---
Created an attachment (id=251)
 --> (https://bugs.busybox.net/attachment.cgi?id=251)
patch that just fixes the reported build issue

Here's a simpler patch that just fixes the reported build issue. Building and
installing libsmbclient correctly will need more changes. I will try to get
this done and open a new bug report for it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
