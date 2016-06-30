From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:44:36 +0200
Subject: [Buildroot] [git commit] erlang: enable compilation on mipsel
Message-ID: <20160630224446.2C71180AD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a542d0fd55e961e3c5805f12bba490d3dcc15d33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang works fine on mipsel platforms so add it to the supported list.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 56cee54..11407db 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# see HOWTO/INSTALL.md for Erlang's supported platforms
 	# when using its native atomic ops implementation
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
-		BR2_sparc_v9 || BR2_arm || BR2_aarch64
+		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel
 
 comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
