From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Oct 2014 05:39:32 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] elfutils on Blackfin doesn't build
In-Reply-To: <bug-7088-163@https.bugs.busybox.net/>
References: <bug-7088-163@https.bugs.busybox.net/>
Message-ID: <20141021053932.1FA1CB0016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

--- Comment #6 from Mike Frysinger <vapier@gentoo.org> 2014-10-21 05:39:28 UTC ---
elfutils also uses quite a bit of glibc-specific features, so it doesn't even
compile for uClibc (the only C library Blackfin supports).  maybe the dep tree
can depend on that instead ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
