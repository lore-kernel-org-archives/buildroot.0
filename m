From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Aug 2016 08:48:30 +0000
Subject: [Buildroot] [Bug 9121] gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
In-Reply-To: <bug-9121-163@https.bugs.busybox.net/>
References: <bug-9121-163@https.bugs.busybox.net/>
Message-ID: <bug-9121-163-4BBXpe1ino@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

--- Comment #4 from Gary Bisson <gary.bisson@boundarydevices.com> ---
Hi,

Actually your log states it uses the rel_imx_3.14.52_1.1.0_ga tag.

Can you list the content of the following folder?
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include

What is strange is that the headers from the git repo are here as expected:
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/include/linux/ipu.h?id=rel_imx_3.14.52_1.1.0_ga
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/include/linux/pxp_device.h?id=rel_imx_3.14.52_1.1.0_ga
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/include/uapi/linux/v4l2-controls.h?id=rel_imx_3.14.52_1.1.0_ga

Regards,
Gary

-- 
You are receiving this mail because:
You are on the CC list for the bug.
