From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:47:54 +0200
Subject: [Buildroot] [git commit] python: use SPDX short identifier for
	license string
Message-ID: <20170409115341.481DC826E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ba222cf6f758adbbf5e6e1720f6b4ca5e21ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
