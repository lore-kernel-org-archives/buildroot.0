From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 10:03:47 +0100
Subject: [Buildroot] [git commit branch/next] package/{protobuf,
 python-protobuf}: bump to version 3.11.3
Message-ID: <20200227100041.B950B8EC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3abd22a28237e2e9a1c62d488e4ae2419380e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 5ebf99a993..c82ae84f22 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	5abfd5bf11dc0a14bb2303883fa76ecde48a4b447eb2f9f90b84592ce8b8707c  protobuf-cpp-3.11.0.tar.gz
+sha256	9ffb1fe6091240f2e7bcaca5b65fb19cb7b951ffc9a60d8b2c9d73f89f0e0a51  protobuf-cpp-3.11.3.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ed21f13c41..1531bfffb2 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.11.0
+PROTOBUF_VERSION = 3.11.3
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index e299b8c760..0ede47ec20 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a5ef6dccfe29f46168af8ab5194147f24701727a84661611fe80532ba83d3edd  protobuf-python-3.11.0.tar.gz
+sha256	a9c6c3821ece08f8db55392edbbec4d4a5392fa5df148188309ed6c5a842e3b7  protobuf-python-3.11.3.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
