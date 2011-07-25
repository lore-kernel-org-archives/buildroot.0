From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jul 2011 06:46:39 +0000 (UTC)
Subject: [Buildroot] [Bug 3631] Error while compiling with Xorg
In-Reply-To: <bug-3631-163@https.bugs.busybox.net/>
References: <bug-3631-163@https.bugs.busybox.net/>
Message-ID: <20110725064639.E99018B49E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3631

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
I believe the problem was a missing pkg-config dependency in the X server,
which I've just fixed. Care to try latest git?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
