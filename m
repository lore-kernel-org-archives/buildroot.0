From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Nov 2015 07:43:05 -0300
Subject: [Buildroot] [PATCH] python-protobuf: fix legal info
Message-ID: <1446720185-10790-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses the same tarball as protobuf hence suffers the same problem as
commit f700463c. Fixes:
http://autobuild.buildroot.net/results/428/4282281e5582b0da8ed3ff44f4d6d86f716ea333/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-protobuf/python-protobuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 2708312..d8be76d 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -8,7 +8,7 @@ PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = $(PROTOBUF_SOURCE)
 PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3c
-PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
+PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
 PYTHON_PROTOBUF_SETUP_TYPE = setuptools
 PYTHON_PROTOBUF_SUBDIR = python
-- 
2.4.10
