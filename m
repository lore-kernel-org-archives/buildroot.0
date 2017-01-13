From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 13 Jan 2017 13:29:49 +0100
Subject: [Buildroot] [PATCH v2] tslib: bump version to 1.3
In-Reply-To: <20170109131247.j527lnxeiwpkwyuv@tarshish>
References: <20170109131247.j527lnxeiwpkwyuv@tarshish>
Message-ID: <1484310589-4486-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
well. Here's the same thing with only the tar.gz hash included.

 package/tslib/tslib.hash | 2 +-
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index fc493e7..a80944c 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  b6450f4d1bc8f4fbbb796a2d1210aee3ccf9ecf302a368dddf279c63eb634833  tslib-1.2.tar.gz
+sha256  599f51c265158e7801b166e879e19759e8d3e5fdf2fa99c630698fe162a41d56  tslib-1.3.tar.gz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 6437f60..d6e66b7 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.2
+TSLIB_VERSION = 1.3
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
-- 
2.1.4
