From: mrugiero at gmail.com <mrugiero@gmail.com>
Date: Mon, 17 Apr 2017 14:22:24 -0300
Subject: [Buildroot] [PATCH 1/2] package: protobuf: bump to v3.2.0.
Message-ID: <20170417172225.20472-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Mario J. Rugiero" <mrugiero@gmail.com>

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/protobuf/protobuf.hash | 2 +-
 package/protobuf/protobuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index b681650a1..21dda69ca 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146 protobuf-v3.0.0.tar.gz
+sha256 2a25c2b71c707c5552ec9afdfb22532a93a339e1ca5d38f163fe4107af08c54c protobuf-v3.2.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 72930c1fe..b2c6427fa 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = v3.0.0
+PROTOBUF_VERSION = v3.2.0
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.12.2
