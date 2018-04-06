From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:02:54 +0200
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <48d440f7-3bdc-4fa8-a7c9-8c3618cd8099@cesnet.cz>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <48d440f7-3bdc-4fa8-a7c9-8c3618cd8099@cesnet.cz>
Message-ID: <20180406210254.76ea686f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 06 Apr 2018 16:53:13 +0200, Jan Kundr?t wrote:

> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.02-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i686-buildroot-linux-gnu"
> BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y

Or also:

https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/fragments/x86-i686--glibc--bleeding-edge-2018.02-1.frag

 :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
