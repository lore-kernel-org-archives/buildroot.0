From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jun 2013 21:19:09 -0000
Subject: [Buildroot] [git commit] libcgicc: handle cgicc-config script
Message-ID: <20130602212040.060FF9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9a2aa3b3845ebdae5bc33ee7064062bb3477b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcgicc/libcgicc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 80e9213..4c5664f 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -9,7 +9,7 @@ LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE=LGPLv3+
 LIBCGICC_INSTALL_STAGING=YES
 LIBCGICC_AUTORECONF=YES
-
+LIBCGICC_CONFIG_SCRIPTS = cgicc-config
 LIBCGICC_CONF_OPT = \
 	--disable-demos \
 	--disable-doc
