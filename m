From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jun 2019 12:02:45 +0000
Subject: [Buildroot] [Bug 11776] qt5webengine 5.12.2 build failed with arm
 toolchain and linaro toolchain
In-Reply-To: <bug-11776-163@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
Message-ID: <bug-11776-163-4qBYMjY6qJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11776

--- Comment #1 from romain.naour at gmail.com ---
Hi,

This could be related to kernel headers version used by the ARM toolchain [1].
Can you test with the Arm AArch64 toolchain 8.3-2019.03 recently updated ?

Note, there are two different issues... I'm not sure about the second issue.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b7d624ab431227af376787148cd7d474088c03aa

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
