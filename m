From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 12:28:41 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: update
 ARC pre-built toolchain
Message-ID: <20180422102852.336F3887B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8469054fff6142d0f7684141feff6eec22aa3d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain has been rebuilt to fix the RPATH of the binutils programs.

Fixes:

  http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-arcle-hs38.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
index b92b9d3066..280f8524cb 100644
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
@@ -3,7 +3,7 @@ BR2_archs38=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-926-gb393c24.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
