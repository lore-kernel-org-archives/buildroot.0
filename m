From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 14:34:14 +0000 (UTC)
Subject: [Buildroot] [Bug 4219] can't complie microperl with error undefined
 reference to `__ctype_b'
In-Reply-To: <bug-4219-163@https.bugs.busybox.net/>
References: <bug-4219-163@https.bugs.busybox.net/>
Message-ID: <20110923143414.E58B68DA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4219

--- Comment #3 from Mike Frysinger <vapier@gentoo.org>  ---
usually when this error comes up, it's because the cross-compile incorrectly
used things like -I/usr/include.  please post the *full* build log of all the
objects as an attachment.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
