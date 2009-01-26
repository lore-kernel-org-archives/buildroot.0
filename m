From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jan 2009 14:21:51 +0000 (UTC)
Subject: [Buildroot] [Bug 69] tar refuses to build
In-Reply-To: <bug-69-163@https.bugs.busybox.net/>
References: <bug-69-163@https.bugs.busybox.net/>
Message-ID: <20090126142151.B415C76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=69


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-01-26 14:21:49 UTC ---
I agree that the current situation isn't optimal - Is there any particular
reason why you want to use the GNU tar version, instead of the one in busybox?
As you probably noticed, most people use the busybox version so the GNU one
doesn't get much testing in BR.

I would prefer to mark the gnu version as DEPRECATED.

Let me know what you think.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
