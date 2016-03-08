From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Mar 2016 21:07:55 +0000
Subject: [Buildroot] [Bug 8766] Compiling host-gcc-final-4.9.3 broken on i386
In-Reply-To: <bug-8766-163@https.bugs.busybox.net/>
References: <bug-8766-163@https.bugs.busybox.net/>
Message-ID: <bug-8766-163-HnkqiKFWQs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Thomas Petazzoni from comment #3)

I also doubt the no-thread option gets used very much. Perhaps the way forward
is to deprecate it and then make threads always available, similar to how we
did for largefile/IPv6?

If i386 support blocks this, then I suggest we drop the i386 variant.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
