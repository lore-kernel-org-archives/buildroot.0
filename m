From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Oct 2013 12:28:32 +0000 (UTC)
Subject: [Buildroot] [Bug 6602] ebtables 64 bit kernel + 32 bit userland
 alignment error - fix included
In-Reply-To: <bug-6602-163@https.bugs.busybox.net/>
References: <bug-6602-163@https.bugs.busybox.net/>
Message-ID: <20131025122832.CBE0C9BBAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6602

--- Comment #2 from Cassiano Martin <cassiano@idbinfo.com.br> 2013-10-25 12:28:31 UTC ---
Yes, you are right. -DKERNEL_64_USERSPACE_32 is enough. Tested on my board and
it worked.

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
