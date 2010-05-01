From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 May 2010 20:32:28 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20100501203228.1D4038D467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, committed. I've fixed up Config.in though, as lua/luac dynamically
links to liblua.so.*, so they need to select it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
