From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2012 07:41:23 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120726074123.7006A96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #10 from Jonathan Liu <net147@gmail.com> 2012-07-26 07:41:23 UTC ---
Have you tried changing root:x: to root:: in /etc/passwd?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
