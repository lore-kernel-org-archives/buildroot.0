From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Aug 2010 08:43:14 +0000 (UTC)
Subject: [Buildroot] [Bug 2395] libglib2-2.24.1 and libxml2-2.7.7 fails
 build on MIPS because is missing -ldl
In-Reply-To: <bug-2395-163@https.bugs.busybox.net/>
References: <bug-2395-163@https.bugs.busybox.net/>
Message-ID: <20100830084314.93EA68A327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2395

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  ---
closing now that we have disabled shared config.cache by default.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
