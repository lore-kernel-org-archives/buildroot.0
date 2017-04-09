From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:48:00 +0200
Subject: [Buildroot] [git commit] python3: use SPDX identifier for license
	string
Message-ID: <20170409115341.521B0826E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e17a1068b8a02d8e4c35e70585420898179d2c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 74f8116..2532dee 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -8,7 +8,7 @@ PYTHON3_VERSION_MAJOR = 3.6
 PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
-PYTHON3_LICENSE = Python software foundation license v2, others
+PYTHON3_LICENSE = Python-2.0, others
 PYTHON3_LICENSE_FILES = LICENSE
 
 # Python itself doesn't use libtool, but it includes the source code
