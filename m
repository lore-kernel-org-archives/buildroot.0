From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 May 2019 00:15:20 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-MIE0kGEWKV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #6 from Carlos Santos <unixmania@gmail.com> ---
I investigated the problem and was unable to reproduce the problem on my test
hardware: 

# lsblk -do NAME,SERIAL
NAME         SERIAL
sda          
mmcblk0      0x439da3eb
mmcblk0boot0 
mmcblk0boot1 

Could you please post a defconfig, preferably based on one of the already
existing qemu defconfig's, with which the problem happens?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
