From: jiao shuaipeng <jiaoshuaipeng@outlook.com>
Date: Thu, 6 Aug 2020 14:31:33 +0000
Subject: [Buildroot] openssh totaly can't use on riscv/arm64 with latest
 buildroot
Message-ID: <VI1PR07MB4590527D56A9FCB9F72F5A1AAB480@VI1PR07MB4590.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

Any one ever use openssh8.3 on RISCV/ARM64 with latest buildroot commit ?

We found the the binary of openssh can generated successfully with the buildroot.
But when we run the application sshd or "ssh-keygen -a", it will be stuck.
I have used the GDB to find root cause why the program is stuch, i see the stach frame is corrupted.

we are using the config "qemu_aarch64_virt_defconfig" and "qemu_riscv32_virt_defconfig", and enable the openssh with "make menucofig". qemu version is 5.0.50.  linux kernel version is 5.1.12.

Thanks
Best Regards,
Joseph
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/d4925a0a/attachment.html>
