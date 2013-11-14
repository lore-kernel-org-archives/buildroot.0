From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:18:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4039] libssp.so missing from target
In-Reply-To: <bug-4039-163@https.bugs.busybox.net/>
References: <bug-4039-163@https.bugs.busybox.net/>
Message-ID: <20131114001826.ED4BC9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4039

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:18:26 UTC ---
The external toolchain logic makes the assumption that the SSP support is
provided by the C library (and therefore part of the usual libc), and not
provided by the compiler (in which case it is a separate libssp.so).

If you have examples of toolchains for which SSP support is provided by a
compiler library, please let us know so we can improve the external toolchain
support. In the mean time, due the age of the bug, I'm closing it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
