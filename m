From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 02 Aug 2016 09:51:27 +0000
Subject: [Buildroot] [Bug 9121] gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
In-Reply-To: <bug-9121-163@https.bugs.busybox.net/>
References: <bug-9121-163@https.bugs.busybox.net/>
Message-ID: <bug-9121-163-VFZ7orNxDN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

--- Comment #7 from Gary Bisson <gary.bisson@boundarydevices.com> ---
Cannot reproduce your issue.

Built your config, had to change the toolchain to use
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM instead of yours in /opt/xxx.

If you haven't already, please 'make clean' before trying again. If still
doesn't work, use the same toolchain as above.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
