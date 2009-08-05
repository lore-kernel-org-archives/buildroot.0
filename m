From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2009 10:50:31 +0000 (UTC)
Subject: [Buildroot] [Bug 487] Make kismet package sexier
In-Reply-To: <bug-487-163@https.bugs.busybox.net/>
References: <bug-487-163@https.bugs.busybox.net/>
Message-ID: <20090805105031.DE69C777EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=487





--- Comment #1 from Will Newton <will.newton@gmail.com>  2009-08-05 10:50:31 UTC ---
Created an attachment (id=571)
 --> (https://bugs.busybox.net/attachment.cgi?id=571)
Ensure /usr/include does not leak into include path


This patch prevents the configure script from adding /usr/include/ncurses into
the include path.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
