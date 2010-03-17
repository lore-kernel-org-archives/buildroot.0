From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Mar 2010 15:23:27 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100317152327.9A652776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213





--- Comment #1 from Grant Edwards <grant.b.edwards@gmail.com>  2010-03-17 15:23:26 UTC ---
Well done.

The patch works for me.

Doing a build no longer contaminates the source tree which prevented
one from using a single source tree to build for two different
configurations or targets.

And "make distclean" now does what it's supposed to. :)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
