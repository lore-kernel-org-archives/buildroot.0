From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2012 14:10:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5570] Cannot compile software on the target machine
In-Reply-To: <bug-5570-163@https.bugs.busybox.net/>
References: <bug-5570-163@https.bugs.busybox.net/>
Message-ID: <20120924141006.88AAF9966D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5570

--- Comment #1 from Maribu <mari.hahn@uni-muenster.de> 2012-09-24 14:10:05 UTC ---
Ok, I found references inside /usr/bin/libtool and also in /usr/lib/*.la on the
target machine referring to paths on the host machine.

For now I fixed the pathes manually. Hopefully I can now compile on the target
machine.

Regards,
Maribu

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
