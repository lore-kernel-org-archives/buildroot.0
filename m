From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 06:44:54 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-cpOFaGBFAx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #2 from sir.ferdek+buildroot at gmail.com ---
I hope this is OK:
https://drive.google.com/open?id=0B-dCRyKJ6D3zTTJJU192VTZJLWc

From what I remember while debugging this, $${ARCH_LIB_DIR} is equal to lib64,
while there are still some libraries in lib dir that need to be copied.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
