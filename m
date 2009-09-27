From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Sep 2009 23:21:50 +0200
Subject: [Buildroot] [git commit master] shared-mime-info: target
	compilation needs target versions of libglib2/libxml2
Message-ID: <20090927212248.F2C9677780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa59f70425e25e8f6ae9a15445d71de4d3cc1b52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/shared-mime-info/shared-mime-info.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 578be4b..74ae149 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -12,7 +12,7 @@ SHARED_MIME_INFO_INSTALL_TARGET = NO
 
 SHARED_MIME_INFO_AUTORECONF = NO
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
-SHARED_MIME_INFO_DEPENDENCIES = host-pkgconfig host-libglib2 host-libxml2
+SHARED_MIME_INFO_DEPENDENCIES = host-pkgconfig host-libglib2 host-libxml2 libxml2 libglib2
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 
-- 
1.6.3.3
