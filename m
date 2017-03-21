From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 21 Mar 2017 17:52:39 +0100
Subject: [Buildroot] [PATCH 2/2] tslib: update to 1.8
In-Reply-To: <1490115159-11252-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1490115159-11252-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <1490115159-11252-2-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For those who are interested, the release notes:

	https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index dea1f91..f8f7ae3 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.7/tslib-1.7.tar.xz.sha256
-sha256  f2a4a416331dd2f38cea84cc526f23da1c342a2588cfae72fe070908f08b5ce8  tslib-1.7.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.8/tslib-1.8.tar.xz.sha256
+sha256  be00af1ad643e3535b1958e4e48fea9905888489d7f1480a957c9e3d1cbaeac5  tslib-1.8.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index e19c8d2..f3e0d94 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.7
+TSLIB_VERSION = 1.8
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
-- 
2.1.4
