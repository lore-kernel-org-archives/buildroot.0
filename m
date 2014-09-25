From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Sep 2014 07:53:05 +0000 (UTC)
Subject: [Buildroot] [Bug 7448] Having export MACHINE="something" breaks
 glibc build on IMX6 target
In-Reply-To: <bug-7448-163@https.bugs.busybox.net/>
References: <bug-7448-163@https.bugs.busybox.net/>
Message-ID: <20140925075305.2804D9D783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7448

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> 2014-09-25 07:53:03 UTC ---
Fixed in git:

http://git.buildroot.net/buildroot/commit/?id=6d3b975653eee06d48f61dde4777e7c5d6abda92

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
