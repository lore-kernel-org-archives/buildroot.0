From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 21:29:41 +0000 (UTC)
Subject: [Buildroot] [Bug 847] Compiling target-gcc v4.4 fails with
 "libc.so.0: cannot open shared object file: No such file or directory"
In-Reply-To: <bug-847-163@https.bugs.busybox.net/>
References: <bug-847-163@https.bugs.busybox.net/>
Message-ID: <20100727212941.60BED82976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=847

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I've just built and tested gcc and g++ on the target for the ARM architecture
with the current Git. There have been quite a few changes since January in the
toolchain support, so I think the bug is fixed.

If you still have an issue with the current Buildroot Git, please reopen the
bug and attach your .config file.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
