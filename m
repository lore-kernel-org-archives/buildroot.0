From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Aug 2011 13:06:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3685] ncurses installation hangs due to old
	version of tic
In-Reply-To: <bug-3685-163@https.bugs.busybox.net/>
References: <bug-3685-163@https.bugs.busybox.net/>
Message-ID: <20110826130617.A035F8D1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3685

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, committed part 2 with minor changes. I prefer to not do part 1 this
close to the release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
