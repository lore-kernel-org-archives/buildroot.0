From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:15 +0530
Subject: [Buildroot] [PATCH 04/10] python: use SPDX short identifier for
	license string
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-4-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python/python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 22d9141..7ba5e37 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -8,7 +8,7 @@ PYTHON_VERSION_MAJOR = 2.7
 PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).13
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
-PYTHON_LICENSE = Python software foundation license v2, others
+PYTHON_LICENSE = Python-2.0, others
 PYTHON_LICENSE_FILES = LICENSE
 PYTHON_LIBTOOL_PATCH = NO
 
-- 
2.7.4
