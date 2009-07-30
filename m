From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 16:37:43 +0000 (UTC)
Subject: [Buildroot] [Bug 513] Add new squid package
In-Reply-To: <bug-513-163@https.bugs.busybox.net/>
References: <bug-513-163@https.bugs.busybox.net/>
Message-ID: <20090730163743.E6371777A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=513





--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-07-30 16:37:43 UTC ---
http://www.squid-cache.org/bugs/show_bug.cgi?id=2662

Basically the only big change they need to do with respect to the original
patch is consider that $build may be wrong thus just pick up CXX_FOR_BUILD or
HOSTCXX in configure.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
