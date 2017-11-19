From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Nov 2017 15:01:37 +0000
Subject: [Buildroot] [Bug 10506] Changed kernel image type (e.g. zImage to
 uImage) does not build on next "make"
In-Reply-To: <bug-10506-163@https.bugs.busybox.net/>
References: <bug-10506-163@https.bugs.busybox.net/>
Message-ID: <bug-10506-163-7eAA7NnNyI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10506

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Buildroot doesn't automatically rebuild when you change the configuration.
Ideally you should indeed to a clean rebuild (i.e. 'make clean; make').
Sometimes you may get away with a shortcut. In this specific case, 'make
linux-rebuild' will do the job.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
