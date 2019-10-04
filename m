From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Oct 2019 21:47:45 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lxc: security bump to
 version 3.2.1
References: <20190816170315.8763-1-fontaine.fabrice@gmail.com>
Message-ID: <18kk6gxhu8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 16 Aug 2019 19:03:15 +0200 schrieb Fabrice Fontaine:

> Signed-off-by: Fabrice Fontaine
> <fontaine.fabrice@gmail.com>

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
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_LIBSECCOMP=y
BR2_PACKAGE_LXC=y]
