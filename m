From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 08:34:14 +0200
Subject: [Buildroot] [PATCH] configs/pandaboard: bump kernel and U-Boot
 versions
In-Reply-To: <20210509171505.28507-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Sun, 9 May 2021 19:15:05 +0200")
References: <20210509171505.28507-1-vincent.stehle@laposte.net>
Message-ID: <87eeefumft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@laposte.net> writes:

 > - Bump kernel to version 5.12.2.
 > - Bump U-Boot to version 2021.04.

 > While at it, enable VFPv3 with 32 registers (instead of 16) and add a few
 > comments to the defconfig.

 > Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---


 > Hi,

 > I have tested on PandaBoard ES: UART, SD card, HDMI(s), USB(s) and ethernet.
 > Testers welcome!

 > We can safely enable VFPv3-D32: NEON implies VFPv3-D32, and all OMAP4 have
 > NEON.

 > Peter, let me know if you do not like the additional defconfig comments and I
 > can re-submit without those.

Committed, thanks.

-- 
Bye, Peter Korsgaard
