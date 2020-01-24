From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Jan 2020 22:50:31 +0000
Subject: [Buildroot] [Bug 12501] libnss-3.49.1: ld error: multiple
 definition of `gcm_HashZeroX_hw'
In-Reply-To: <bug-12501-163@https.bugs.busybox.net/>
References: <bug-12501-163@https.bugs.busybox.net/>
Message-ID: <bug-12501-163-T6GpS7WfWe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12501

--- Comment #1 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
Hi Aleksandr,

here you can find a patch that solves the problem:
https://patchwork.ozlabs.org/patch/1229021/

It bumps to version 3.49.2, where they've fixed that bug.

Can you try to apply it and check if it works correctly?

Thank you

-- 
You are receiving this mail because:
You are on the CC list for the bug.
