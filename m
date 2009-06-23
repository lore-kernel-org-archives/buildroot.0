From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Jun 2009 07:34:19 +0000 (UTC)
Subject: [Buildroot] [Bug 411] ipsec-tools: Bump version to 0.7.2
In-Reply-To: <bug-411-163@https.bugs.busybox.net/>
References: <bug-411-163@https.bugs.busybox.net/>
Message-ID: <20090623073419.C16E2777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=411


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-06-23 07:34:19 UTC ---
Thanks, committed. We might want to remove those references to netbsd in
Config.in though.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
