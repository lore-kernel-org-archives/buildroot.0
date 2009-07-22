From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Jul 2009 15:04:06 +0000 (UTC)
Subject: [Buildroot] [Bug 387] Tremor not installed to toolchain
In-Reply-To: <bug-387-163@https.bugs.busybox.net/>
References: <bug-387-163@https.bugs.busybox.net/>
Message-ID: <20090722150406.1F0B9777E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387





--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-22 15:04:05 UTC ---
(In reply to comment #4)

> /usr/lib/libvorbisenc.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status

FYI, the reference to /usr/lib is because of a bug in pkg-config's sysroot
support which I'm fixing now.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
