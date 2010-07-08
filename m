From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] Remove *_FOR_TARGET variables
	from TARGET_CONFIGURE_OPTS
Message-ID: <20100708115825.AE3848269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=359090e693846cc62b9390363e79b5d7afb83eee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those variables are not standard.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0fc8deb..0d80a2a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -193,11 +193,6 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
-		AR_FOR_TARGET="$(TARGET_AR)" \
-		AS_FOR_TARGET="$(TARGET_AS)" \
-		CC_FOR_TARGET="$(TARGET_CC)" \
-		LD_FOR_TARGET="$(TARGET_LD)" \
-		NM_FOR_TARGET="$(TARGET_NM)" \
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-- 
1.7.1
