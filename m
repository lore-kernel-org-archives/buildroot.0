From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Nov 2009 23:00:36 +0000 (UTC)
Subject: [Buildroot] [Bug 703] [SECURITY] Update openssl package to 0.9.8l
In-Reply-To: <bug-703-163@https.bugs.busybox.net/>
References: <bug-703-163@https.bugs.busybox.net/>
Message-ID: <20091115230036.6AF6277785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=703


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-15 23:00:35 UTC ---
Thanks, committed. It would have been good to document why you need
openssl-ditch.reject.patch though.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
