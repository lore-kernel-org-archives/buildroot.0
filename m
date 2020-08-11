From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 19:31:53 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-aXdhXRkrjt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #10 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Yann E. MORIN from comment #6)

Is resolved/worksforme not a little harsh as there is definitely a existing
problem (and a fix for it) and not yet determined if it is caused by the 
filesystem and/or a WSL?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
