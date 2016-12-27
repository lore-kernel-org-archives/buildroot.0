From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 10:44:45 +0100
Subject: [Buildroot] BB-Black setup fails to boot using Buildroot
 Training Lab Book [December 26, 2016]
In-Reply-To: <1482829391152-153506.post@n4.nabble.com>
References: <1482829391152-153506.post@n4.nabble.com>
Message-ID: <20161227104445.052db2dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Dec 2016 01:03:11 -0800 (PST), Ashish_Kumar_Mishra wrote:

> U-Boot 2016.03 (Dec 27 2016 - 12:45:34 +0530)
> 
>        Watchdog enabled
> I2C:   ready
> DRAM:  512 MiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> Net:   Could not get PHY for cpsw: addr 0
> cpsw, usb_ether
> Press SPACE to abort autoboot in 1 seconds
> reading uImage-dtb.am335x-boneblack
> ** Unable to read file uImage-dtb.am335x-boneblack **
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> =>   
> 
> 
> Could group members please provide few pointers to get the proper board
> booting  .

I suspect you forgot to put the uEnv.txt file on the SD card. Please
read again the "Flash the system" section of the "Basic Buildroot
usage" lab.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
