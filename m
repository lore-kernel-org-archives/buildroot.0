From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jan 2020 12:32:50 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-MbGbNLOtg6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

--- Comment #5 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
This happens only with folder ending with "m4". If you try rebuild with:

make O=output-m4-tiny qemu_x86_64_defconfig
make minicom

It passes that point.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
