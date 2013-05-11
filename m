From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 May 2013 19:53:21 +0000 (UTC)
Subject: [Buildroot] [Bug 5054] amd64: cannot find init - due to missing
	/lib64 folder
In-Reply-To: <bug-5054-163@https.bugs.busybox.net/>
References: <bug-5054-163@https.bugs.busybox.net/>
Message-ID: <20130511195321.4AC4C9A096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5054

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2013-05-11 19:53:05 UTC ---
Fixed by GUstavo in git (603293f5ff8e), thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
