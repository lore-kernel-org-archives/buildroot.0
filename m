From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Mon, 27 Nov 2017 19:27:23 -0800
Subject: [Buildroot] [PATCH 2/2] rauc: bump to version 0.2
In-Reply-To: <20171128032723.14081-1-yurovsky@gmail.com>
References: <20171128032723.14081-1-yurovsky@gmail.com>
Message-ID: <20171128032723.14081-2-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.2 of rauc provides several bug fixes and minor feature
enhancements.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 78c3e279d6..649d19571e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.1.1/rauc-0.1.1.tar.xz.asc
-sha256 d2901d493f1d3210aef6411e83b02edac3a678d6d825d71a1c61b5b6afc7e478 rauc-0.1.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v0.2/rauc-0.2.tar.xz.asc
+sha256 83aa3ac3716e1c29315162e3cbf5d4db79f26dd95efe1bc634bbce364b95491a rauc-0.2.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 67ef1556e7..4909062cf5 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.1.1
+RAUC_VERSION = 0.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.14.3
