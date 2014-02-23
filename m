From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 16:32:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140223163224.E4D889B669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #3 from syntheticpp at gmx.net 2014-02-23 16:32:24 UTC ---
Investigated it further: there are no problems when eglibc is used, only with
uclibc.

A grep for 'hard' or "EABI" in the uclibc-0.9.33.2 sources shows nothing
relevant, so I assume eabihf is not supported by uclibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
