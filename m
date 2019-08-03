From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Aug 2019 15:48:55 +0000
Subject: [Buildroot] [Bug 11271] utils/check-package fails with exception
 depending on path prefix
In-Reply-To: <bug-11271-163@https.bugs.busybox.net/>
References: <bug-11271-163@https.bugs.busybox.net/>
Message-ID: <bug-11271-163-5A64R8MCGt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11271

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
The fix has *finally* been merged:
https://git.buildroot.org/buildroot/commit/?id=1842bb1470cac3b8bf59b69f33b098761e07a02c

-- 
You are receiving this mail because:
You are on the CC list for the bug.
