From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Jun 2017 13:03:45 +0000
Subject: [Buildroot] [Bug 9941] nodejs option disappears for arm
In-Reply-To: <bug-9941-163@https.bugs.busybox.net/>
References: <bug-9941-163@https.bugs.busybox.net/>
Message-ID: <bug-9941-163-OtWOpx7ZuS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9941

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Refik Tuzakli from comment #2)

Ok, then please provide some more details:
 - What buildroot version
 - What is your .config

nodejs depends on:
default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 &&
BR2_ARM_CPU_HAS_VFPV2

You mention that you are using an ARMv7 core. Have you enabled FPU support?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
