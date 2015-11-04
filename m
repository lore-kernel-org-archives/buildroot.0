From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 18:38:31 +0100
Subject: [Buildroot] [git commit] protobuf-c: bump version to v1.1.1
Message-ID: <20151104175603.5ECAB7FE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2517c3df6b37ecc42d741f723cbe7f8f52d3cb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf-c/protobuf-c.hash |    2 ++
 package/protobuf-c/protobuf-c.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
new file mode 100644
index 0000000..7584058
--- /dev/null
+++ b/package/protobuf-c/protobuf-c.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 49340784ca0f8657f38547088731fff3bfe8084adb89bf5e8dbc19ac43339aa6 protobuf-c-v1.1.1.tar.gz
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index d73eb25..ee4500e 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = v1.0.0-rc1
+PROTOBUF_C_VERSION = v1.1.1
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
