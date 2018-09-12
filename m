From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Sep 2018 21:23:00 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-1pZnmEGX3y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Philipp Richter from comment #2)

That is the downside if your are stuck to a vendor kernel, but
according to [1] you can try (experimental) linux kernel mainline
support...

[1]
https://github.com/umiddelb/armhf/wiki/How-To-compile-a-custom-Linux-kernel-for-your-ARM-device

-- 
You are receiving this mail because:
You are on the CC list for the bug.
