From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Apr 2010 09:38:53 +0000 (UTC)
Subject: [Buildroot] [Bug 1591] portmap fails to compile
In-Reply-To: <bug-1591-163@https.bugs.busybox.net/>
References: <bug-1591-163@https.bugs.busybox.net/>
Message-ID: <20100416093853.38E428DC2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1591





--- Comment #1 from Kelvin Cheung <keguang.zhang@gmail.com>  2010-04-16 09:38:52 UTC ---
(In reply to comment #0)

I found libutil is disabled in the default configuration
(toolchain/uClibc/uClibc-0.9.31.config)

...
# UCLIBC_HAS_GETPT is not set
# UCLIBC_HAS_LIBUTIL is not set
UCLIBC_HAS_TM_EXTENSIONS=y
...

Maybe we could enable it by default.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
