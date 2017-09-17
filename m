From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 20:47:08 +0200
Subject: [Buildroot] [PATCH 1/2] protobuf, python-protobuf: bump to v3.4.1
Message-ID: <20170917184709.22532-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 1c7bd43b01..7829c6f312 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5e2587dea2f9287885e3b04d3a94ed4e8b9b2d2c5dd1f0032ceef3ea1d153bd7 protobuf-cpp-3.3.0.tar.gz
+sha256 2bb34b4a8211a30d12ef29fd8660995023d119c99fbab2e5fe46f17528c9cc78 protobuf-cpp-3.4.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 51c791a810..d2782ddcfd 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.3.0
+PROTOBUF_VERSION = 3.4.1
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 7da2fed03f..e32f143166 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3fd180eee78c7ee2e7a1b2f02657ef61ccbc2537a6767cd2493077d3b38c9d2d protobuf-python-3.3.0.tar.gz
+sha256 1faa722cf475c8e4c43ddb393d6f1477f1a56c93be38a1c8e367c358db476b5f protobuf-python-3.4.1.tar.gz
-- 
2.11.0
