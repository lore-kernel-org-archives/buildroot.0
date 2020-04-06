From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Apr 2020 19:47:23 +0000
Subject: [Buildroot] [Bug 12761] Buildroot fails when building GCNano
 binaries for the STM32MP1
In-Reply-To: <bug-12761-163@https.bugs.busybox.net/>
References: <bug-12761-163@https.bugs.busybox.net/>
Message-ID: <bug-12761-163-LUz3s1H7jg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12761

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. Could you try building against the 4.19 kernel
provided by ST at https://github.com/STMicroelectronics/linux/ ? It is very
likely that the kernel driver they ship as part of the gcnano-binaries package
builds fine only with their 4.19 kernel.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
