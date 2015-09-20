From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Sep 2015 12:56:10 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150920125610.5930D8181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-20 12:56:09 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=890c9e761b70f28c2f2d6c4cf389e418c6d2b32c.
Thanks Arnout for the investigation and fix!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
