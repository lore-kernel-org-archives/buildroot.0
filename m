From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Jul 2009 09:10:36 +0000 (UTC)
Subject: [Buildroot] [Bug 89] changing the default string for GNU target
 suffix does not work
In-Reply-To: <bug-89-163@https.bugs.busybox.net/>
References: <bug-89-163@https.bugs.busybox.net/>
Message-ID: <20090727091036.86BA1777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=89





--- Comment #1 from Will Newton <will.newton@gmail.com>  2009-07-27 09:10:35 UTC ---

I'm not sure if this is a bug. The valid options here are defined by the gcc
configure system and elf-uclibc is not a valid way to configure gcc. uClibc
does not support non-Linux systems in any case. 

The help for this option has a reference to hurd which could be removed
however.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
