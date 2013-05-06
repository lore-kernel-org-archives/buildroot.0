From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 May 2013 16:39:02 +0200
Subject: [Buildroot] [PATCH v4 0/5]   barebox new option and new boards
In-Reply-To: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130506163902.6f85ff91@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon,  6 May 2013 16:10:52 +0200, Fabio Porcedda wrote:

> Fabio Porcedda (5):
>   barebox: add custom version option
>   barebox: bump version to 2013.05.0
>   linux: use BR2_LINUX_KERNEL_LATEST_VERSION as option name
>   configs: add defconfig for Telit EVK-PRO3
>   configs: add defconfig for Atmel AT91SAM9260-EK Nand Flash Boot

For consistency, uboot should adopt the same scheme, IMO.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
