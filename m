From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 21:34:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1171] Linuxthreads new cannot find sysdep.h
In-Reply-To: <bug-1171-163@https.bugs.busybox.net/>
References: <bug-1171-163@https.bugs.busybox.net/>
Message-ID: <20100718213406.BD3A7807F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1171

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |raj.khem at gmail.com

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I've tested a simple x86 toolchain-only build with LINUXTHREADS_NEW, and
indeed, it fails with this exact error message. This problem was also reported
at http://old.nabble.com/LINUXTHREADS_NEW-bug.-td19717126.html but it doesn't
seem to have been fixed.

I think we should try to ask uClibc people about this. Khem, can you share some
info about the status of LINUXTHREADS_NEW in uClibc ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
