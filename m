From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2011 19:55:10 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <4EDF2529.60003@free.fr>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <4ED91A0B.10403@relinux.de> <20111203000854.6dcc2764@skate>
 <201112030453.45164.minimod@morethan.org>
 <20111203120816.4c0f862a@skate> <4EDF2529.60003@free.fr>
Message-ID: <20111209195510.162c410e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 07 Dec 2011 09:34:49 +0100,
Julien Boibessot <julien.boibessot@free.fr> a ?crit :

> Thomas is right. To use PREEMPT_RT with Buildroot a:
>     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>     BR2_LINUX_KERNEL_VERSION="3.0.12"
>    
> BR2_LINUX_KERNEL_PATCH="http://www.kernel.org/pub/linux/kernel/projects/rt/3.0/patch-3.0.12-rt29.patch.bz2"
> is enough.
> Ok, this implies that the user knows what he wants to do, but this is
> generally the case when using PREEMPT-RT as this patch is only
> available for a restricted number of Linux kernel versions.

Agreed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
