From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2009 19:43:38 +0000 (UTC)
Subject: [Buildroot] [Bug 225] m4 macros are out of place
In-Reply-To: <bug-225-163@https.bugs.busybox.net/>
References: <bug-225-163@https.bugs.busybox.net/>
Message-ID: <20090329194338.4C875771F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=225


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-29 19:43:37 UTC ---
Actually it's the other way around. r25827 wrongly changed the aclocal search
dir to point to HOST_DIR instead of STAGING_DIR. It's fixed in r25880.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
