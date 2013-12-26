From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Dec 2013 21:44:39 +0000 (UTC)
Subject: [Buildroot] [Bug 5294] uclibc build ignores target CFLAGS and
	LDFLAGS
In-Reply-To: <bug-5294-163@https.bugs.busybox.net/>
References: <bug-5294-163@https.bugs.busybox.net/>
Message-ID: <20131226214439.08BA59C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5294

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-12-26 21:44:38 UTC ---
This is intended behaviour.
*libc builds (glibc, eglibc, uClibc) are usually very sensitive to
optimizations and can break in unexpected ways even by tweaking the
optimization level (-O?).
If there's a valid reason to set a special compiler flag for some breakage or
such please reopen with detailed information.
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
