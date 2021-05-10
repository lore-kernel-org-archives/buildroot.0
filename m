From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 08:41:00 +0200
Subject: [Buildroot] [PATCH] configs/wandboard: bump kernel and U-Boot
 versions
In-Reply-To: <20210509100141.22063-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Sun, 9 May 2021
 12:01:41 +0200")
References: <20210509100141.22063-1-vincent.stehle@laposte.net>
Message-ID: <875yzrum4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? via buildroot <buildroot@busybox.net> writes:

 > - Bump kernel to version 5.12.2.
 > - Bump U-Boot to version 2021.04.

 > While at it, switch U-Boot to the Kconfig build system and add some more
 > comments to the defconfig.

 > Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 > Cc: Fabio Estevam <festevam@gmail.com>
 > ---


 > Hi,

 > UART, SD card(s), USB, ethernet and HDMI work for me. More testers for e.g.
 > SATA and audio are welcome!

 > Fabio, if you do not like the additional comments in the defconfig please let
 > me know and I can re-submit without those.

 > Best regards,

Committed, thanks.

-- 
Bye, Peter Korsgaard
