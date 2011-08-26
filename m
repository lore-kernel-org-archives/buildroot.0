From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Aug 2011 07:29:43 +0000 (UTC)
Subject: [Buildroot] [Bug 3817] Failed to compile binutils-2.21
In-Reply-To: <bug-3817-163@https.bugs.busybox.net/>
References: <bug-3817-163@https.bugs.busybox.net/>
Message-ID: <20110826072943.3C7418D1D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3817

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #0)
> /bin/sh: error while loading shared libraries: /usr/lib/libc.so: invalid ELF
> header

> I could work around this problem by doing the following:
> $cd /usr/lib
> $rm libc.so
> $ln -s /lib/libc.so.6 libc.so
> 
> But this is not the best way, because ASCII file /usr/lib/libc.so's missing
> incurs other problems, fox example "make menuconfig" fails to launch

Huh, is your system libc corrupt? Are you building as root?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
