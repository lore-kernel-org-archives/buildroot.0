From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 20:41:52 +0000
Subject: [Buildroot] [Bug 9726] Raspberry Pi version B - Problems with UART
 speed in Buildroot 2016.11.2 and 2017.2
In-Reply-To: <bug-9726-163@https.bugs.busybox.net/>
References: <bug-9726-163@https.bugs.busybox.net/>
Message-ID: <bug-9726-163-iFTsqkgaXL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9726

--- Comment #4 from WZab <wzab01@gmail.com> ---
I agree, that defconfigs work correctly, because they do not use U-Boot.
Probably this is a U-Boot related problem.
At the moment we are using the U-Boot from BR 2016.02, which works fine.
If I'll find any explanation of the problem and a fix, I'll report it

With best regards,
Wojtek

-- 
You are receiving this mail because:
You are on the CC list for the bug.
