From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Mar 2009 23:50:28 +0000 (UTC)
Subject: [Buildroot] [Bug 153] not able to build buildroot
In-Reply-To: <bug-153-163@https.bugs.busybox.net/>
References: <bug-153-163@https.bugs.busybox.net/>
Message-ID: <20090306235029.36E2A764AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=153


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-06 23:50:28 UTC ---
NTPL threads is not supported on x86-64 in uclibc, so please select PTHREAD_OLD
(and disable multilib) and it should work


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
