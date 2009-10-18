From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 19:10:47 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018191047.C786E7778B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #9 from rvpaasen <rvpaasen@t3i.nl>  2009-10-18 19:10:47 UTC ---
I used an Ubuntu 9.04 system to build. The autogen.sh script was also called
before configuring the package by the previous samba.mk and since it didn't
break the build (on my system), I kept the call in place. The package also
builds without calling autogen.sh so it's probably best to remove it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
