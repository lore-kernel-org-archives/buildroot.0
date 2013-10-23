From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Oct 2013 22:46:13 +0000 (UTC)
Subject: [Buildroot] [Bug 6566] PHP segfault when crosscompiled to mips64 -
 patch included
In-Reply-To: <bug-6566-163@https.bugs.busybox.net/>
References: <bug-6566-163@https.bugs.busybox.net/>
Message-ID: <20131023224613.A0D7F9B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6566

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2013-10-23 22:46:13 UTC ---
Thanks, I've committed a slightly tweaked patch (use our existing BR2_ENDIAN
symbol instead) as 21a4a9003e3.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
