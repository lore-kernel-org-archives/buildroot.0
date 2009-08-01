From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Aug 2009 17:42:55 +0000 (UTC)
Subject: [Buildroot] [Bug 523] pciutiles can't find libz
In-Reply-To: <bug-523-163@https.bugs.busybox.net/>
References: <bug-523-163@https.bugs.busybox.net/>
Message-ID: <20090801174255.46F1B777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=523





--- Comment #3 from Bernhard Reutner-Fischer <aldot@uclibc.org>  2009-08-01 17:42:54 UTC ---
(In reply to comment #2)

> broken toolchain and/or toolchain setup.
> What does
> $ grep TOOLCHAIN .config
> say?
> 
nm, you attached it, sorry.
BR2_TOOLCHAIN_EXTERNAL=y

Just use the internal toolchain.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
