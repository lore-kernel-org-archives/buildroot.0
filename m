From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 May 2018 21:40:44 +0200
Subject: [Buildroot] [PATCH 1/1] qemu_arm_vexpress: use latest Linux
 kernel
In-Reply-To: <20180506163059.5801-1-Florian.LaRoche@googlemail.com>
References: <20180506163059.5801-1-Florian.LaRoche@googlemail.com>
Message-ID: <20180506214044.786e3dbd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Florian,

Thanks for your contribution.

On Sun,  6 May 2018 18:30:59 +0200, Florian La Roche wrote:
> There should be no reason to keep the qemu_arm_vexpress target
> on an older kernel release, so change this to build with the latest
> Linux kernel release for buildroot.
> 
> 
> Signed-off-by: Florian La Roche <Florian.LaRoche@googlemail.com>

There is a reason why all defconfigs used a fixed U-Boot / kernel
version: we want those versions to have been tested and confirmed to
work on the target platform.

So, a patch updating to Linux 4.16 would be fine, but not a patch that
changes to automatically use the latest version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
