From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Mar 2017 20:35:04 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-lccAryhJrQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Your patch shouldn't be necessary because $${ARCH_LIB_DIR} in the loop should
be responsible for copying the contents of lib/.

Can you share a tarball of the toolchain you have built with Crosstool-NG, so
we can see why it doesn't work as expected?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
