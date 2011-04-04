From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Apr 2011 13:47:14 +0000 (UTC)
Subject: [Buildroot] [Bug 3541] Quotes in the top Makefile:217 break
 buildroot/kernel config build under cygwin
In-Reply-To: <bug-3541-163@https.bugs.busybox.net/>
References: <bug-3541-163@https.bugs.busybox.net/>
Message-ID: <20110404134714.AB7BA81ED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3541

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks.

Out of interest, is Buildroot really working for you on Cygwin? I don't recall
ever hearing for any other Cygwin users.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
