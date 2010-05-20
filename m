From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 May 2010 21:14:14 +0000 (UTC)
Subject: [Buildroot] [Bug 1693] NTP trys IPV& even if not configured error:
 'IPV6_MULTICAST_HOPS' undeclared
In-Reply-To: <bug-1693-163@https.bugs.busybox.net/>
References: <bug-1693-163@https.bugs.busybox.net/>
Message-ID: <20100520211414.653158D466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1693

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git (484d15dea6) - Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
