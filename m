From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Oct 2019 17:58:07 +0200
Subject: [Buildroot] [PATCH] package/vim: bump to version 1929
References: <20190830184034.26771-1-chrismcc@gmail.com>
Message-ID: <f5rm6gx2nc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 30 Aug 2019 11:40:32 -0700 schrieb Christopher McCrory:

> Signed-off-by: Christopher McCrory
> <chrismcc@gmail.com>

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
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_VIM=y]
