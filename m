From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2010 13:19:48 +0000 (UTC)
Subject: [Buildroot] [Bug 801] [PATCH] iperf update to 2.0.4
In-Reply-To: <bug-801-163@https.bugs.busybox.net/>
References: <bug-801-163@https.bugs.busybox.net/>
Message-ID: <20100322131948.BCF9B77664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=801


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-22 13:19:48 UTC ---
Committed, thanks. The DISABLE_IPV6 stuff isn't needed as that is automatically
added by the Makefile.autotools.in stuff.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
