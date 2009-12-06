From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 14:43:33 +0000 (UTC)
Subject: [Buildroot] [Bug 751] Kernel 2.6 snapshot fetch fail
In-Reply-To: <bug-751-163@https.bugs.busybox.net/>
References: <bug-751-163@https.bugs.busybox.net/>
Message-ID: <20091206144333.B0A93777B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=751


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-12-06 14:43:32 UTC ---
The SNAPSHOT option is for using a local kernel snapshot rather than E.G.
downloading the latest git snapshot as a tarball and using that (something that
currently isn't even available on kernel.org).

The help text does hint about this, but I've tweaked a few things to make it
more user friendly (+ fixed the bug that caused it to use linux-2.6..tar.bz2
and not linux-2.6.tar.bz2) in git (ce64e350111b).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
