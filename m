From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 15:11:10 +0000 (UTC)
Subject: [Buildroot] [Bug 3631] Error while compiling with Xorg
In-Reply-To: <bug-3631-163@https.bugs.busybox.net/>
References: <bug-3631-163@https.bugs.busybox.net/>
Message-ID: <20130526151110.423619A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3631

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 15:10:00 UTC ---
I've tested once again building X.org with the fbdev driver with current
master, and it builds perfectly fine.

Since the bug reporter has never attached any Buildroot .config that exhibits
the problem, and we're unable to reproduce, I'm marking this one as working for
me. If someone faces the issue, do not hesitate to reopen this bug, but please
include more details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
