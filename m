From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Jul 2013 00:40:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6374] gnutls package broken if linux cryptodev
	module selected
In-Reply-To: <bug-6374-163@https.bugs.busybox.net/>
References: <bug-6374-163@https.bugs.busybox.net/>
Message-ID: <20130719004041.A54F09A621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6374

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-07-19 00:40:52 UTC ---
Solved in git with the latest (3.2.2) gnutls version bump.
Thanks for the report.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
