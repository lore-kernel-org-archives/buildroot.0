From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:37:57 +0100
Subject: [Buildroot] [git commit] package/{protobuf,
 python-protobuf}: bump to version 3.11.0
Message-ID: <20191224133523.AFC658E248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56611562bb2c135408d392b9b058ae846723fd51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with test-pkg, all tests passed:
            br-arm-full [1/6]: OK
 br-arm-cortex-a9-glibc [2/6]: OK
  br-arm-cortex-m4-full [3/6]: SKIPPED
         br-x86-64-musl [4/6]: OK
     br-arm-full-static [5/6]: SKIPPED
           sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index edb5fb6f03..5ebf99a993 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e82ee5bdde198e0a1935e280748a86a7989474ea771418a2fd90f03e2e65b99b  protobuf-cpp-3.10.1.tar.gz
+sha256	5abfd5bf11dc0a14bb2303883fa76ecde48a4b447eb2f9f90b84592ce8b8707c  protobuf-cpp-3.11.0.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 82e21df5f0..ed21f13c41 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.10.1
+PROTOBUF_VERSION = 3.11.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index fe883a96df..e299b8c760 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	39c7a5e7e557b24fc324bec3a73054d277ed9b9b320b273564e04f862131e679  protobuf-python-3.10.1.tar.gz
+sha256	a5ef6dccfe29f46168af8ab5194147f24701727a84661611fe80532ba83d3edd  protobuf-python-3.11.0.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
