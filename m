From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 11:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: CodeSourcery AArch64 2014.11
 does not contain libatomic
In-Reply-To: <20210109123337.1512700-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 9 Jan 2021 13:33:37 +0100")
References: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
Message-ID: <87pn2ampup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes build error
 > output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-amd-linux-gnu/4.9.1/../../../../aarch64-amd-linux-gnu/bin/ld:
 >  cannot find -latomic

 > using this defconfig

 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64=y
 > BR2_PACKAGE_OPENSSL=y

 > libopenssl is only used here as an example: all packages adding -latomic
 > if BR2_TOOLCHAIN_HAS_LIBATOMIC=y are broken, like dav1d, ffmpeg, gnutls,
 > kodi and vlc.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
