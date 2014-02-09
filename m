From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Feb 2014 06:18:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5780] spurious build failure because it cannot
 remove ubinize.cfg
In-Reply-To: <bug-5780-163@https.bugs.busybox.net/>
References: <bug-5780-163@https.bugs.busybox.net/>
Message-ID: <20140209061829.E99779C8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5780

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-09 06:18:29 UTC ---
Fixed with commit 
http://git.buildroot.net/buildroot/commit/?id=74a0f963ed364f90b937fc24f06573f5512c612c

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
