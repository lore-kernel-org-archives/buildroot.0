From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 May 2010 08:43:04 +0000 (UTC)
Subject: [Buildroot] [Bug 1789] binutils fails to build for i386
In-Reply-To: <bug-1789-163@https.bugs.busybox.net/>
References: <bug-1789-163@https.bugs.busybox.net/>
Message-ID: <20100530084304.D9621C037B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1789

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  ---
I've reverted the commit (6b939d40f6a) for now, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
