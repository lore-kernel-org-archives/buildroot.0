From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 23:00:32 +0100
Subject: [Buildroot] [git commit] package/c-ares: bump version to 1.14.0
Message-ID: <20180309221057.F2602828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=103855a2e0ef04851cd460176c31393589ceb1de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 79928ae843..832c4dfcfb 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 03f708f1b14a26ab26c38abd51137640cb444d3ec72380b21b20f1a8d2861da7 c-ares-1.13.0.tar.gz
+sha256 45d3c1fd29263ceec2afc8ff9cd06d5f8f889636eb4e80ce3cc7f0eaf7aadc6e c-ares-1.14.0.tar.gz
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 72019a0425..67254244a1 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.13.0
+C_ARES_VERSION = 1.14.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
