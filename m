From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Dec 2016 16:47:42 +0000
Subject: [Buildroot] [Bug 9461] toolchain Linaro AArch64 2016.11 compile
	error
In-Reply-To: <bug-9461-163@https.bugs.busybox.net/>
References: <bug-9461-163@https.bugs.busybox.net/>
Message-ID: <bug-9461-163-68q7n8fX2m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

--- Comment #1 from romain.naour at openwide.fr ---
Hi,

The odroidc2 kernel doesn't support gcc6 yet.
Can you look if there is a newer odroidc2 kernel or try to backport this patch
[1].

Thank for your report!

Best regards,
Romain Naour

[1]
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=677fa15cd6d5b0843e7b9c58409f67d656b1ec2f

-- 
You are receiving this mail because:
You are on the CC list for the bug.
