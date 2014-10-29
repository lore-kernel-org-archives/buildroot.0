From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Oct 2014 21:24:39 +0100
Subject: [Buildroot] [PATCH 05/15 v6] package/eudev: bump to 1.10
References: <cover.1414442699.git.yann.morin.1998@free.fr>
 <a60b93d041af1e32c5c8f49b0c4e4f69f6736e98.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <XnsA3D5D9CD47DDCberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:a60b93d041af1e32c5c8f49b0c4e4f69f6736e98.1414442699.git.yann.morin.1998
@free.fr:

> -EUDEV_VERSION = 1.9
> +EUDEV_VERSION = 1.10

Hi Yann,

a new version of eudev has been released; to bump, this patch

-EUDEV_VERSION = 1.10
+EUDEV_VERSION = 2.1

is enough to get the package compiled, a special note about this bump can be 
found here: https://wiki.gentoo.org/wiki/Udev/upgrade#udev_216_to_217

"Since this version, kernel setting CONFIG_FW_LOADER_USER_HELPER should be 
set to =n, because the userspace firmware loader has been removed. You need 
to upgrade the kernel at least to version 3.7 for the kernel firmware 
loader."

I will conduct runtime testing of libudev 2.1 in my environment in the next 
days.

Regards, Bernd
