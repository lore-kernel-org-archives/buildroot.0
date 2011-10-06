From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Oct 2011 12:56:25 +0000 (UTC)
Subject: [Buildroot] [Bug 4117] 2011.08: default config with qt + ssl.
	Linking fails
In-Reply-To: <bug-4117-163@https.bugs.busybox.net/>
References: <bug-4117-163@https.bugs.busybox.net/>
Message-ID: <20111006125625.9CDAD8E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4117

--- Comment #4 from AWa. <awa_wp@wp.pl>  ---
System:
  Linux apps 2.6.38-11-generic #48-Ubuntu SMP Fri Jul 29 19:02:55 UTC 2011
x86_64 x86_64 x86_64 GNU/Linux

Buildroot:
  buildroot-2011.08.tar.bz2
  arm/arm926t
  Config file attached.

Test program:
  http://blog.superpat.com/2010/07/14/semaphores-on-linux-sem_init-vs-sem_open/

If this program is build with dynamic library it fail when run on sem_init()
with error: "Function not implemented".

Semaphores on my system works,  for example, when I use semget().
Program can be linked as static or dynamic executable.
Example program from:
 http://www.cs.uregina.ca/Links/class-info/330/Semaphore/semaphore.html
program7_1.cpp

AWa.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
