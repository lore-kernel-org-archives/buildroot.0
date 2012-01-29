From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:46 +0100
Subject: [Buildroot] [RFC 13/15] tslib: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-14-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/tslib/tslib.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 885bd88..b59daaa 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,6 +5,7 @@
 #############################################################
 TSLIB_VERSION = 412d99d8b92c
 TSLIB_SITE = git://github.com/kergoth/tslib.git
+TSLIB_LICENSE = GPL_V2
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.7.5.4
