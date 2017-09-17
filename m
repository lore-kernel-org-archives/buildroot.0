From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 20:47:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/protobuf-c: bump version to 1.3.0
In-Reply-To: <20170917184709.22532-1-bernd.kuhls@t-online.de>
References: <20170917184709.22532-1-bernd.kuhls@t-online.de>
Message-ID: <20170917184709.22532-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/protobuf-c/protobuf-c.hash | 2 +-
 package/protobuf-c/protobuf-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index 7584058e95..49644574fe 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 49340784ca0f8657f38547088731fff3bfe8084adb89bf5e8dbc19ac43339aa6 protobuf-c-v1.1.1.tar.gz
+sha256 fd8f6f5d6927330cf2b8b4ec8332de8b1ee2b8f2480b52ee3f221aad6de2082c protobuf-c-v1.3.0.tar.gz
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 391b3103f8..4306610533 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = v1.1.1
+PROTOBUF_C_VERSION = v1.3.0
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
-- 
2.11.0
