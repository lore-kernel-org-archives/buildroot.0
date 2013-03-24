From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:36:02 +0100
Subject: [Buildroot] [git commit] neon: add license informations
Message-ID: <20130324194036.BAFD19B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff0865a94694dd964278585c85c4401598b5a6aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index cec72f8..58e01e1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -5,6 +5,8 @@
 #############################################################
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
+NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
+NEON_LICENSE_FILES = src/COPYING.LIB src/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
