From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:04:16 +0100
Subject: [Buildroot] [git commit] package/{protobuf,
 python-protobuf}: bump to version 3.11.4
Message-ID: <20200327085224.9FEEC810FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30d6c1cb6ad21afe4df06ee918027e9f3e23a8e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 4 ++--
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index c82ae84f22..df5e9c62d9 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	9ffb1fe6091240f2e7bcaca5b65fb19cb7b951ffc9a60d8b2c9d73f89f0e0a51  protobuf-cpp-3.11.3.tar.gz
-sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
+sha256  ba4bbc3e6b58d2ccfe406e616576ef48710a2aae205f463618025fc691549cfe  protobuf-cpp-3.11.4.tar.gz
+sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 1531bfffb2..381649a4e7 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.11.3
+PROTOBUF_VERSION = 3.11.4
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 0ede47ec20..929f88548a 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a9c6c3821ece08f8db55392edbbec4d4a5392fa5df148188309ed6c5a842e3b7  protobuf-python-3.11.3.tar.gz
-sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
+sha256  5fe38d70962e4a6bb4d663e63b0906d5bd08a1b590841e08c5148cdbb63732b5  protobuf-python-3.11.4.tar.gz
+sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
