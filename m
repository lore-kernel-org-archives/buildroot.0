From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:38:22 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: bump to version
 0.10.10
Message-ID: <20210406071628.29DBA8D3EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed6e6ebdf382cdb542012c72ad7e6bd00721dfe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/meetecho/janus-gateway/blob/v0.10.10/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index ee71979b88..83afc72c98 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f8c58e5c5ed94821ce877169da90c00e4adf81920ed383a2e0ec241960d121b  janus-gateway-0.10.3.tar.gz
+sha256  21e2fc7dee4b20ed8d749a69577eccd961b0bfe5b863d42f39ddfcd2af903718  janus-gateway-0.10.10.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 98a2184d7d..40652d802a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.10.3
+JANUS_GATEWAY_VERSION = 0.10.10
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
