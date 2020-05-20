From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 May 2020 00:04:30 +0000
Subject: [Buildroot] [Bug 12361] Init system (systemd) kills login on
 Raspberry Pi Zero
In-Reply-To: <bug-12361-163@https.bugs.busybox.net/>
References: <bug-12361-163@https.bugs.busybox.net/>
Message-ID: <bug-12361-163-sguU1hbgrR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12361

--- Comment #3 from Adam Duskett <aduskett@gmail.com> ---
(In reply to scaramouche from comment #0)
Luckily in the intermittent, you can fix this bug by changing "console" to
"ttyS0" under System configuration ---> Run a getty (login prompt) after boot
---> TTY port

-- 
You are receiving this mail because:
You are on the CC list for the bug.
