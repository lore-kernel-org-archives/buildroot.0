From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed,  3 Mar 2021 16:57:40 +0100
Subject: [Buildroot] [PATCH] package/{protobuf,
 python-protobuf}: bump to version 3.15.3
Message-ID: <20210303155741.222365-1-buildroot@heine.tech>
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
index 001b41be9a..084f8ce0f2 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  50ec5a07c0c55d4ec536dd49021f2e194a26bfdbc531d03d1e9d4d3e27175659  protobuf-cpp-3.14.0.tar.gz
+sha256  984a65bcc3522b40b7aa493e392dc7ff710c2e4254fdd3ca0594a16f32391199  protobuf-cpp-3.15.3.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 661b7a6b81..99174841ea 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.14.0
+PROTOBUF_VERSION = 3.15.3
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index c8762b5416..f74625bd2f 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  969019c5fd9c1345f0b34afa06ab2664c1441d159d5ae87ded5fa01d79f028c1  protobuf-python-3.14.0.tar.gz
+sha256  f777d95da5b870b8d5e06765bec3596a9ad5aa1f1595279a4836db562e82e281  protobuf-python-3.15.3.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1
