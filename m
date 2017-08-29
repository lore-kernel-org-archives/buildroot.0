From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Aug 2017 09:56:28 +0000
Subject: [Buildroot] [Bug 10261] Grub2 fails to build for x86_64
In-Reply-To: <bug-10261-163@https.bugs.busybox.net/>
References: <bug-10261-163@https.bugs.busybox.net/>
Message-ID: <bug-10261-163-MfwAnaAA4K@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

--- Comment #2 from Erico Nunes <nunes.erico@gmail.com> ---
I have done a lot of grub2 builds for x86_64 on Fedora 25 and even recently
tested the pc_x86_64_bios_defconfig and pc_x86_64_efi_defconfig configs on
Fedora 26 as well and did not hit this issue.

Is this a clean build (make clean all)?
Can you please attach a .config file where you see the problem, for us to try
to reproduce it?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
