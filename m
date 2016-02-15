From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Feb 2016 20:51:50 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-6sxZV4d276@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Your path
output/target/data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/xorg
looks really wrong.

Why do you have Buildroot itself inside an output/target/data directory ?

Or maybe output/target/data just happens to be the place where you store the
Buildroot sources ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
