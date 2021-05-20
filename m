From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 20 May 2021 15:28:40 +0200
Subject: [Buildroot] [PATCH] package/{protobuf,
 python-protobuf}: bump to version 3.17
Message-ID: <20210520132841.158262-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 79d3184f59..6818b6f83a 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  bbdfb7455431d7d58666e8a2996d14b236718ff238eecde10646581e4c87f168  protobuf-cpp-3.15.6.tar.gz
+sha256  84d30a78cae000be164ac6b973ee1dc0664669d63685dfbcf96f058c50456f19  protobuf-cpp-3.17.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ea75480038..7ba99d2c4b 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.15.6
+PROTOBUF_VERSION = 3.17.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 0d3665b736..3ed9de739a 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e8c58a14950ac7a727864d5c521f48c81feb66ff7df325487fc930c9aa50d8b  protobuf-python-3.15.6.tar.gz
+sha256  3011bfbc18d1c695ee393cb0dc1042282cfa33ef6573fe82732aefc9f7286121  protobuf-python-3.17.0.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1
