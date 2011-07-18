From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 23:17:39 +0200
Subject: [Buildroot] [git commit] shared-mime-info: remove default options
Message-ID: <20110718211805.0F41B8A656@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d57c7ae55707861f92545cdeb50f1dc39a778979
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/shared-mime-info/shared-mime-info.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 50b0f25..b24540d 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -8,9 +8,7 @@ SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-SHARED_MIME_INFO_INSTALL_TARGET = YES
 
-SHARED_MIME_INFO_AUTORECONF = NO
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
 
-- 
1.7.3.4
