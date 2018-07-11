From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Wed, 11 Jul 2018 17:32:53 +0300
Subject: [Buildroot] BR2_LINUX_KERNEL_PATCH for linux-headers
Message-ID: <fea35efb-0134-f091-5cbd-30292f137b33@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

Both linux and linux-headers package use BR2_LINUX_KERNEL_PATCH. But 
BR2_LINUX_KERNEL_PATCH is available if BR2_LINUX_KERNEL is selected. I 
want to build toolchain only. And don't want to build linux kernel. So I 
deselect BR2_LINUX_KERNEL and lose BR2_LINUX_KERNEL_PATCH for linux-headers.

I think BR2_LINUX_KERNEL_PATCH must not depend on BR2_LINUX_KERNEL.

Thanks

Serj Kalichev
