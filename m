From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Apr 2015 12:15:10 +0000 (UTC)
Subject: [Buildroot] [Bug 8016] collectd fails to build,
 network.c:171:19: error: 'IPV6_MULTICAST_HOPS' undeclared
In-Reply-To: <bug-8016-163@https.bugs.busybox.net/>
References: <bug-8016-163@https.bugs.busybox.net/>
Message-ID: <20150416121510.0BA93818A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8016

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-04-16 12:15:09 UTC ---
You can't change toolchain options without doing a complete rebuild, that's the
problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
