From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Mar 2018 20:41:32 +0100
Subject: [Buildroot] [PATCH v3 0/7] Add rpi3 b+ support
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316204132.30aadcfc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Fri, 16 Mar 2018 18:02:25 +0000, Martin Bark wrote:

> Martin Bark (7):
>   package/rpi-firmware: bump version
>   configs/raspberrypi*: bump kernel version
>   board/raspberrypi: add support for rpi3 b+
>   package/rpi-firmware: improve installation of dtb files
>   package/rpi-bt-firmware: change to LibreELEC github repo
>   package/rpi-wifi-firmware: change to LibreELEC github repo
>   DEVELOPERS: add myself for rpi packages

Since you're looking at RPi stuff, could you have a look at
http://patchwork.ozlabs.org/patch/779105/, which is sitting in
patchwork since quite a while ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
