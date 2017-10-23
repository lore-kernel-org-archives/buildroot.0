From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Oct 2017 12:18:36 +0000
Subject: [Buildroot] [Bug 10451] libpcap 1.8.x and 1.7x does not compile on
	PPC
In-Reply-To: <bug-10451-163@https.bugs.busybox.net/>
References: <bug-10451-163@https.bugs.busybox.net/>
Message-ID: <bug-10451-163-aIQPvvYXxU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10451

--- Comment #4 from Karl Krach <mail@kkrach.de> ---
Doesn't compile with GCC 6.4 either:

output/host/bin/powerpc-buildroot-linux-uclibcspe-gcc --version
powerpc-buildroot-linux-uclibcspe-gcc.br_real (Buildroot 2017.08-dirty) 6.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
