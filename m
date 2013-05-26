From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 11:37:16 +0000 (UTC)
Subject: [Buildroot] [Bug 6128] [patch] Fix S01logging pidfile handling
In-Reply-To: <bug-6128-163@https.bugs.busybox.net/>
References: <bug-6128-163@https.bugs.busybox.net/>
Message-ID: <20130526113716.D45B39A309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6128

Samuel Martin <s.martin49@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Samuel Martin <s.martin49@gmail.com> 2013-05-26 11:36:07 UTC ---
The S01logging script typo has been merged.

The pidfile management remains deferred to start-stop-daemon, so the change in
the busybox configs is not needed; though any user can enable it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
