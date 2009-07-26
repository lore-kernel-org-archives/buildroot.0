From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Jul 2009 22:07:30 +0000 (UTC)
Subject: [Buildroot] [Bug 403] Error while building ISO9660 image
In-Reply-To: <bug-403-163@https.bugs.busybox.net/>
References: <bug-403-163@https.bugs.busybox.net/>
Message-ID: <20090726220730.5AAC2777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=403


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-26 22:07:29 UTC ---
The iso9660 target needs a Linux kernel to be built. I have changed the
dependencies to make this clearer in git.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
