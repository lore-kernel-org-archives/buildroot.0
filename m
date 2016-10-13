From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:39:46 +0200
Subject: [Buildroot] [git commit] c-ares: security bump to version 1.12.0
Message-ID: <20161013054826.6EA50805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d199dcff054d22a1ccc730fadfc7543b8c6e8f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-5180 - ares_create_query single byte out of buffer write

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index f24cc36..f46ef02 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd c-ares-1.11.0.tar.gz
+sha256 8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb c-ares-1.12.0.tar.gz
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 298fe41..e817d4a 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.11.0
+C_ARES_VERSION = 1.12.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
