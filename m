From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Oct 2019 17:58:49 +0200
Subject: [Buildroot] [PATCH] package/physfs: bump to version 3.0.2
References: <20190831104416.10983-1-romain.naour@gmail.com>
Message-ID: <p6rm6gx2nc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 31 Aug 2019 12:44:16 +0200 schrieb Romain Naour:

> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_PHYSFS=y]
