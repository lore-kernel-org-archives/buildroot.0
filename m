From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jan 2016 19:10:31 +0000
Subject: [Buildroot] [Bug 8576] Building embedded Linux for Atmel
 SAMA5D4_Xplained with HDMI work not propber. HDMI does not work
In-Reply-To: <bug-8576-163@https.bugs.busybox.net/>
References: <bug-8576-163@https.bugs.busybox.net/>
Message-ID: <bug-8576-163-Tx6wO3bCrD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8576

--- Comment #1 from JensAmberg <JensAmberg@mail.de> ---
Ok i habe investigated the problem. It depends on wrong clock. With the new
bootloader the CPU clock is set to 600 MHZ. But the kernel does not handle this
correct.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
