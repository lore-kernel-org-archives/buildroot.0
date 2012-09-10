From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Sep 2012 11:05:47 +0000 (UTC)
Subject: [Buildroot] [Bug 5378] dropbear Makefile broken
In-Reply-To: <bug-5378-163@https.bugs.busybox.net/>
References: <bug-5378-163@https.bugs.busybox.net/>
Message-ID: <20120910110547.AE3FF995E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5378

--- Comment #3 from Tilman Keskin?z <arved@arved.at> 2012-09-10 11:05:46 UTC ---
The build of the dropbear package was failing, because there was no rule to
create "-lcrypt" obj.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
