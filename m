From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:45:52 +0200
Subject: [Buildroot] [git commit] package/protobuf-c: bump version to 1.3.0
Message-ID: <20170924140311.A28C27FD0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f079c1953c21daa37518d4170ad619b723076e93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/protobuf-c/protobuf-c.hash | 2 +-
 package/protobuf-c/protobuf-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index 7584058..e22a9f1 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 49340784ca0f8657f38547088731fff3bfe8084adb89bf5e8dbc19ac43339aa6 protobuf-c-v1.1.1.tar.gz
+sha256 fd8f6f5d6927330cf2b8b4ec8332de8b1ee2b8f2480b52ee3f221aad6de2082c protobuf-c-v1.3.0.tar.gz
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 391b310..4306610 100644
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
