From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 17:18:18 +0200
Subject: [Buildroot] [git commit] neon: fix license files
Message-ID: <20130514151956.1EE0F9A1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a6a1b94a22d3ed4ce450cfec9c40cce0a447c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPL license is under test/, not src/.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 58e01e1..3bff302 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,7 +6,7 @@
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
-NEON_LICENSE_FILES = src/COPYING.LIB src/COPYING README
+NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
