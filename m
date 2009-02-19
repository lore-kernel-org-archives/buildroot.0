From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Feb 2009 12:09:27 +0000 (UTC)
Subject: [Buildroot] [Bug 109] Make pppd package avoid bsd err
In-Reply-To: <bug-109-163@https.bugs.busybox.net/>
References: <bug-109-163@https.bugs.busybox.net/>
Message-ID: <20090219120927.BFCF8766F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=109


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-19 12:09:25 UTC ---
Thanks, fixed in r25386. the FOO_CAT is commonly used by the old style
packages, so I left it in. It should probably be converted to
Makefile.autotools.in format.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
