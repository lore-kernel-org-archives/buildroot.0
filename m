From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Jun 2018 09:22:55 -0500
Subject: [Buildroot] [PATCH] protobuf: bump to 3.6.0
Message-ID: <20180620142255.31441-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following issue and brauto builds
https://github.com/google/protobuf/issues/3937
http://autobuild.buildroot.net/results/982f727495c1d3524685015c34b1cbb1e0bbb4b0
http://autobuild.buildroot.net/results/adbd3088e24d7e681c995f8c3d1db0e14ac500ba

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/protobuf/protobuf.hash | 2 +-
 package/protobuf/protobuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 4492487efb..33f0e3076f 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c28dba8782da2cfea1e11c61d335958c31a9c1bc553063546af9cbe98f204092 protobuf-cpp-3.5.1.tar.gz
+sha256 c3cab055964d554e4fd85067fe3e9eb45c9915cebcf537e97fafaa245376bce1  protobuf-cpp-3.6.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 1440589c14..9caf87ed93 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.5.1
+PROTOBUF_VERSION = 3.6.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
-- 
2.17.0
