From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Nov 2010 20:58:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2785] mtd-utils build fails due to missing libmtd
In-Reply-To: <bug-2785-163@https.bugs.busybox.net/>
References: <bug-2785-163@https.bugs.busybox.net/>
Message-ID: <20101118205807.8007C8A40C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2785

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, committed a simplified (always just build libmtd.a) version to git.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
