From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2015 15:40:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7951] gcc 4.9.2 fails to build for
	sparc-buildroot-linux-gnu
In-Reply-To: <bug-7951-163@https.bugs.busybox.net/>
References: <bug-7951-163@https.bugs.busybox.net/>
Message-ID: <20150319154003.71DE181885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7951

--- Comment #2 from Uwe Hermann <uwe@hermann-uwe.de> 2015-03-19 15:40:03 UTC ---
Yup, qemu_sparc_ss10_defconfig works for me as well. The attached config (based
on a fresh checkout, "make menuconfig" and only minimal changes to the config
settings) doesn't build for me though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
