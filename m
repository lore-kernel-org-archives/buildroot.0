From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jul 2009 11:07:37 +0000 (UTC)
Subject: [Buildroot] [Bug 247] ntfsprogs: new package
In-Reply-To: <bug-247-163@https.bugs.busybox.net/>
References: <bug-247-163@https.bugs.busybox.net/>
Message-ID: <20090728110738.0EE997780D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=247





--- Comment #1 from Will Newton <will.newton@gmail.com>  2009-07-28 11:07:37 UTC ---

This package requires toolchain locale support so should depend on the
appropriate config variable (BR2_ENABLE_LOCALE).

Otherwise this patch works ok for me.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
