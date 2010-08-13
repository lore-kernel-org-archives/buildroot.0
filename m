From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 14:29:49 +0000 (UTC)
Subject: [Buildroot] [Bug 2401] sysvinit-2.86 fails to build on MIPS because
 is missing -lcrypt
In-Reply-To: <bug-2401-163@https.bugs.busybox.net/>
References: <bug-2401-163@https.bugs.busybox.net/>
Message-ID: <20100813142950.0142E87458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2401

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
By the way, Sergio, which distribution are you using ? Here, even my limited
x86_64 Debian chroot has /usr/lib/libcrypt.a, so I didn't see the potential
problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
