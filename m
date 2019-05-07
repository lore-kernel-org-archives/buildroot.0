From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:58:01 +0200
Subject: [Buildroot] [git commit] package/vde2: replace utf-8 space by ascii
 character
Message-ID: <20190507210157.EF437815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91f03aefaa737f35943b0b7d537b4c57554a4f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/vde2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index e2ec12416e..29337601c4 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -15,7 +15,7 @@ VDE2_INSTALL_STAGING = YES
 VDE2_AUTORECONF = YES
 
 # Reasons for enabling/disabling stuff:
-#??- tuntap is enabled in the hope we're using a recent-enough toolchain
+# - tuntap is enabled in the hope we're using a recent-enough toolchain
 #   that does have if_tun.h (virtually everything these days)
 # - kvde_switch is disabled because it requires a patched kernel
 # - cryptcab is disabled to not depend on openSSL
@@ -34,7 +34,7 @@ VDE2_CONF_OPTS = \
 	--disable-python \
 	--enable-tuntap
 
-#??Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
 
 HOST_VDE2_CONF_OPTS = \
