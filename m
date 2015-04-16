From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Apr 2015 02:16:54 +0000 (UTC)
Subject: [Buildroot] [Bug 4934] Memory leak in pthread_mutext_timedlock
In-Reply-To: <bug-4934-163@https.bugs.busybox.net/>
References: <bug-4934-163@https.bugs.busybox.net/>
Message-ID: <20150416021654.3337680506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4934

????????? <alek.gricak2009@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |buildroot at uclibc.org
          Component|Threads                     |Outdated package
           Platform|Other                       |All
            Version|unspecified                 |2015.02
         AssignedTo|unassigned at uclibc.org       |unassigned at buildroot.uclibc
                   |                            |.org
            Product|uClibc                      |buildroot
   Target Milestone|---                         |2015.02

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
