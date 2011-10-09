From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Oct 2011 21:27:43 +0000 (UTC)
Subject: [Buildroot] [Bug 4171] makedevs-unused-but-set-variable.patch
In-Reply-To: <bug-4171-163@https.bugs.busybox.net/>
References: <bug-4171-163@https.bugs.busybox.net/>
Message-ID: <20111009212743.6CD708E294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4171

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks. I had to apply manually as your patch was against an old BR version
(/bin/sync call got removed back in March). I guess that's also the reason why
you brought this up as we previously built makedevs with -Werror, which we
don't do any more.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
