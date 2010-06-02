From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Jun 2010 19:03:39 +0000 (UTC)
Subject: [Buildroot] [Bug 1909] netperf-2.4.5 fails to build because of
 undeclared SOCK_DCCP
In-Reply-To: <bug-1909-163@https.bugs.busybox.net/>
References: <bug-1909-163@https.bugs.busybox.net/>
Message-ID: <20100602190339.60C857F9F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1909

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
