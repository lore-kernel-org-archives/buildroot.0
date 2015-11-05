From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 13:28:35 +0100
Subject: [Buildroot] [git commit] python-protobuf: fix legal info
Message-ID: <20151105123003.A4BED8181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1475560039fabca5a8b74965d794b49d756f15a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses the same tarball as protobuf hence suffers the same problem as
commit f700463c. Fixes:
http://autobuild.buildroot.net/results/428/4282281e5582b0da8ed3ff44f4d6d86f716ea333/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-protobuf/python-protobuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
