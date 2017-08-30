From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 08:32:40 +0000
Subject: [Buildroot] [Bug 10276] BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS
 with "gpio-hammer.o: ABI is incompatible with that of the selected
 emulation"
In-Reply-To: <bug-10276-163@https.bugs.busybox.net/>
References: <bug-10276-163@https.bugs.busybox.net/>
Message-ID: <bug-10276-163-vNOrxNZEtI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10276

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you try to adapt https://patchwork.ozlabs.org/patch/729154/ to the gpio
linux-tools package, and see if it works for you ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
