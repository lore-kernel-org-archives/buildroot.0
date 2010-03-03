From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Mar 2010 23:15:54 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] Buildroot fails to account for "nof"
 subdirectory (no floating point)
In-Reply-To: <bug-1225-163@https.bugs.busybox.net/>
References: <bug-1225-163@https.bugs.busybox.net/>
Message-ID: <20100303231554.58C297775E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225





--- Comment #5 from gnemesure <gnemesure@avtec.com>  2010-03-03 23:15:53 UTC ---
The use of an "nof" subdirectory is to support the multilib capability enabled
by BR2_ENABLE_MULTILIB. When this is disabled, the "nof" directory is not used,
and the original problem does not occur.

Probably need to check this flag in the gcc-uclibc-*.mk makefile.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
