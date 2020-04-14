From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Apr 2020 14:50:32 -0300
Subject: [Buildroot] Setting better names for partitions
Message-ID: <CAOMZO5Cr9PUnSNDtMk7rcA_mC3FTe1AkCJT=9Jpj4WUKSMeDJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On i.MX we usually generate the boot images via
board/freescale/common/imx/post-image.sh script, which creates two
partitions:
- One that contains the dtb and kernel
- One for rootfs

The names of these partitions are strings like 5934-861D and
ad09a287-46a9-4790-ba97-fbbb549e5e96.

Is there a way to specify a better name for the partitions? Something
like "boot" and "rootfs" instead?

If so, how can this be achieved?

Thanks,

Fabio Estevam
