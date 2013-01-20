From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:43:24 +0100
Subject: [Buildroot] [git commit] speex: add license informations
Message-ID: <20130120202431.5D1E782750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ebbd5f636d4fbe63b1a2c1c02aa0431e09effa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/speex/speex.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 917de34..2fe179c 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -5,6 +5,9 @@
 #############################################################
 SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
+SPEEX_LICENSE = BSD-3c
+SPEEX_LICENSE_FILES = COPYING
+
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
