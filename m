From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2019 23:16:50 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-UsOomBwktP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #5 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Ciro Santilli from comment #4)

I found that ti-gfx contains a script using devmem2 and submitted a patch to
remove the dependency: https://patchwork.ozlabs.org/patch/1145451/

There are still 8 board configurations that select devmem2, for reasons that I
don't know:

  - at91sam9x5ek_dev_defconfig
  - at91sam9x5ek_mmc_dev_defconfig
  - atmel_sama5d27_som1_ek_mmc_dev_defconfig
  - atmel_sama5d2_xplained_mmc_dev_defconfig
  - atmel_sama5d3_xplained_dev_defconfig
  - atmel_sama5d3_xplained_mmc_dev_defconfig
  - atmel_sama5d4_xplained_dev_defconfig
  - atmel_sama5d4_xplained_mmc_dev_defconfig

-- 
You are receiving this mail because:
You are on the CC list for the bug.
