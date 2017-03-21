From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 21 Mar 2017 17:52:38 +0100
Subject: [Buildroot] [PATCH 1/2] tslib: add project overview page to help
	text
Message-ID: <1490115159-11252-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index bc5d790..e3c8ec2 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TSLIB
 	  Tslib is a filtering layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
+	  http://tslib.org
 
 comment "tslib needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-- 
2.1.4
