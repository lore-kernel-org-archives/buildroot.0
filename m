From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 19:51:38 +0000 (UTC)
Subject: [Buildroot] [Bug 497] OpenSSL RSA key generation hangs on x86_64
In-Reply-To: <bug-497-163@https.bugs.busybox.net/>
References: <bug-497-163@https.bugs.busybox.net/>
Message-ID: <20090729195138.59461777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=497


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-29 19:51:37 UTC ---
Fixed in git (2a966bc) using ARCH


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
