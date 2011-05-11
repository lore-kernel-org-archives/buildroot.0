From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 May 2011 20:14:38 +0000 (UTC)
Subject: [Buildroot] [Bug 3703] Consider using /usr/bin/env bash in scripts
In-Reply-To: <bug-3703-163@https.bugs.busybox.net/>
References: <bug-3703-163@https.bugs.busybox.net/>
Message-ID: <20110511201438.2BDA2834A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3703

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Does buildroot otherwise work on freebsd? I would expect some of the host
packages to fail.

I'm not against freebsd support as such, but it needs active testers to ensure
it keeps working as all the main devs use Linux.

In general, the least troublesome option for building embedded Linux systems
with buildroot is running it on a Linux system.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
