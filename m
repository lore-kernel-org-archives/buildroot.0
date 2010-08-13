From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 10:21:54 +0000 (UTC)
Subject: [Buildroot] [Bug 2371] QT MYSQL Module does not build
In-Reply-To: <bug-2371-163@https.bugs.busybox.net/>
References: <bug-2371-163@https.bugs.busybox.net/>
Message-ID: <20100813102154.D431C87456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2371

--- Comment #5 from Paul Jones <paul@pauljones.id.au>  ---
I had the MYSQL server installed on the host, uninstalling that fixed the
problem. I also had it installed on the other computer but it still worked.
Seems like a path search order issue or something?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
