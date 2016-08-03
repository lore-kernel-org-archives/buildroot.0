From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:29:25 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: bump kernel and u-boot
	version for m4 support
In-Reply-To: <1470244189-32091-1-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 3 Aug 2016 19:09:49 +0200")
References: <1470244189-32091-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87r3a5h9zu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Also adding the '-m4' device tree blobs which allow to disable the
 > peripherals that are used by the Cortex-M4.

 > The 6x_bootscript is already setup to load the '-m4' dtb if m4enabled
 > u-boot variable is set to 1.

 > The FreeRTOS BSP for both Nitrogen6SX and Nitrogen7 can be found here:
 > https://github.com/boundarydevices/freertos-boundary

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
