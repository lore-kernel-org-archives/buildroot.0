From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 23:55:59 +0200
Subject: [Buildroot] [git commit branch/next] package/protobuf: bump to
 version 3.5.1
Message-ID: <20180517221014.81D0E8A5DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=454aa2da5e79ec8627f1d66ac640ec7bb04025dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GRPC requires protobuf 3.5.0+

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index fa02440a40..4492487efb 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2bb34b4a8211a30d12ef29fd8660995023d119c99fbab2e5fe46f17528c9cc78 protobuf-cpp-3.4.1.tar.gz
+sha256 c28dba8782da2cfea1e11c61d335958c31a9c1bc553063546af9cbe98f204092 protobuf-cpp-3.5.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index d2782ddcfd..1440589c14 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.4.1
+PROTOBUF_VERSION = 3.5.1
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 91cab4ecc0..9c7606ce34 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1faa722cf475c8e4c43ddb393d6f1477f1a56c93be38a1c8e367c358db476b5f protobuf-python-3.4.1.tar.gz
+sha256 13d3c15ebfad8c28bee203dd4a0f6e600d2a7d2243bac8b5d0e517466500fcae protobuf-python-3.5.1.tar.gz
