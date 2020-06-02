From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 22:14:19 +0200
Subject: [Buildroot] [git commit] package/protobuf: bump to 3.12.2
Message-ID: <20200602201356.5C24982952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84f16b6c871a834fec3d987e75a98b5a48a47919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index df5e9c62d9..18bb2ace96 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba4bbc3e6b58d2ccfe406e616576ef48710a2aae205f463618025fc691549cfe  protobuf-cpp-3.11.4.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
+sha256  f2f180e9343cbb2b9a8482255bfec2176a2cc7fa22de496535a0a0cf38797495  protobuf-cpp-3.12.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 381649a4e7..08787ef623 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.11.4
+PROTOBUF_VERSION = 3.12.2
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 929f88548a..ad5b51b591 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5fe38d70962e4a6bb4d663e63b0906d5bd08a1b590841e08c5148cdbb63732b5  protobuf-python-3.11.4.tar.gz
+sha256  1f9299046b508b528056804fac806e8f429b190526f909288535e4faa37d949a  protobuf-python-3.12.2.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
