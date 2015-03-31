From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Mar 2015 22:13:19 +0200
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi2: update and fix
	our defconfig
References: <1424817743-3627-1-git-send-email-yann.morin.1998@free.fr>
 <1424817743-3627-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <XnsA46EE20DEE8A9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:1424817743-3627-2-git-send-email-yann.morin.1998 at free.fr:

> -BR2
_LINUX_KERNEL_CUSTOM_REPO_VERSION="3c9fd364bfa6c0f6ef725d74b72a9b77dd0d0fb4"
> +BR2
_LINUX_KERNEL_CUSTOM_REPO_VERSION="23c76b7f608e51258c6fca02aebeb5d588583149"

Hi Yann,

downloading the kernel source fails seems to be broken:

>>> linux 23c76b7f608e51258c6fca02aebeb5d588583149 Downloading
Doing full clone
Cloning into bare repository 'linux-
23c76b7f608e51258c6fca02aebeb5d588583149'...
POST git-upload-pack (gzip 1074 to 571 bytes)
remote: Counting objects: 4091705, done.
remote: Compressing objects: 100% (8/8), done.
remote: Total 4091705 (delta 0), reused 0 (delta 0), pack-reused 4091697
Receiving objects: 100% (4091705/4091705), 1.14 GiB | 5.51 MiB/s, done.
Resolving deltas: 100% (3373468/3373468), done.
fatal: not a tree object

Regards, Bernd
