From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 15:29:07 +0200
Subject: [Buildroot] [PATCH 2/3] package/protobuf: bump version to 3.13
In-Reply-To: <20200911132907.11748-1-buildroot@heine.tech>
References: <20200911132907.11748-1-buildroot@heine.tech>
Message-ID: <20200911132907.11748-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash | 2 +-
 package/protobuf/protobuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index aa9d871561..c11f54edc3 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  ccfbaaba52f67e0e6536a05f3df3f6618620d255513cfca3a07f5935b624e26b  protobuf-cpp-3.12.4.tar.gz
+sha256  f8a547dfe143a9f61fadafba47fa6573713a33cb80909307c1502e26e1102298  protobuf-cpp-3.13.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 04fea3063e..2395221313 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.12.4
+PROTOBUF_VERSION = 3.13.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
-- 
2.25.1
