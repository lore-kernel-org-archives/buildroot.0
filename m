From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jan 2010 09:57:02 +0000 (UTC)
Subject: [Buildroot] [Bug 937] Bump openvpn package to 2.1.1
In-Reply-To: <bug-937-163@https.bugs.busybox.net/>
References: <bug-937-163@https.bugs.busybox.net/>
Message-ID: <20100120095702.D42E6776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=937


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-01-20 09:57:02 UTC ---
You missed the two select statements under BR2_PACKAGE_OPENVPN, but I fixed
that myself - Committed, thanks!


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
