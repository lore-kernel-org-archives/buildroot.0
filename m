From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Sep 2010 21:53:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2521] Can't compile sdl_mixer,
	mikmod.h can't be found
In-Reply-To: <bug-2521-163@https.bugs.busybox.net/>
References: <bug-2521-163@https.bugs.busybox.net/>
Message-ID: <20100925215341.50EE58B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2521

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
You'll need a cross compiled version of mikmod, a version for your build host
doesn't help.

Currently we don't have any mikmod package in BR, but I've fixed it in git so
the configure script at least doesn't get confused when it's installed on the
host.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
