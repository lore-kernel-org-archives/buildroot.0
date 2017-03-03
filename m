From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 22:00:23 +0000
Subject: [Buildroot] [Bug 9706] Can't download newer revisions of package
	from PyPI
In-Reply-To: <bug-9706-163@https.bugs.busybox.net/>
References: <bug-9706-163@https.bugs.busybox.net/>
Message-ID: <bug-9706-163-8oFTRdRjiE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9706

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
When bumping the package, SUPERVISOR_SITE should change from the current 

http://pypi.python.org/packages/source/s/supervisor

to

https://pypi.python.org/packages/44/80/d28047d120bfcc8158b4e41127706731ee6a3419c661e0a858fb0e7c4b2d

but it's not unusual for the _SITE to change when the version is bumped.

I don't see how this is a bug, so I'm closing as invalid. If you disagree, feel
free to reopen.

PS if you do bump the package, don't forget to send the patch to the Buildroot
mailing list for upstream inclusion.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
