From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 15:57:18 +0000 (UTC)
Subject: [Buildroot] [Bug 1171] Linuxthreads new cannot find sysdep.h
In-Reply-To: <bug-1171-163@https.bugs.busybox.net/>
References: <bug-1171-163@https.bugs.busybox.net/>
Message-ID: <20110918155718.47DED8CA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1171

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
linuxthreads new now seems to work fine with uClibc 0.9.32, at least an i386
and ARM Buildroot build with toolchain and Busybox work fine. uClibc 0.9.30.2
is probably still broken, but we aren't going to fix that sort of problems in
older versions of uClibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
