From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Feb 2019 19:28:05 +0000
Subject: [Buildroot] [Bug 11671] russian locale ru_RU:145: LC_TIME: syntax
 error
In-Reply-To: <bug-11671-163@https.bugs.busybox.net/>
References: <bug-11671-163@https.bugs.busybox.net/>
Message-ID: <bug-11671-163-LMF0HWKVml@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11671

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
The 'locale' command is not (yet) installed into the target image, but
you should find it under:

-
build/glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/build/locale/locale
- host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/locale

For examples on how to set (from program or from environment) see
hints at patch two...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
