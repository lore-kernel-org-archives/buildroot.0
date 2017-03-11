From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Mar 2017 20:38:04 +0000
Subject: [Buildroot] [Bug 9726] Raspberry Pi version B - Problems with UART
 speed in Buildroot 2016.11.2 and 2017.2
In-Reply-To: <bug-9726-163@https.bugs.busybox.net/>
References: <bug-9726-163@https.bugs.busybox.net/>
Message-ID: <bug-9726-163-9fj0Xd2fGq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9726

--- Comment #2 from WZab <wzab01@gmail.com> ---
I have fond the temporary workaround. The U-Boot generated with Buildroot
1016.02 and the attached configuration is able to load correctly the kernels
generated with 2016.11.
The zImage generated with the same configuration is used as a "rescue image"
allowing to modify the contents of the SD card without removing it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
