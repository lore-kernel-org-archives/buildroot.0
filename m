From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 15:44:36 +0100
Subject: [Buildroot] [git commit] coreutils: bump to version 8.25
Message-ID: <20160120145035.44C5181FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c99085de7ded8e5ff772db91f0f0940c2c6f38e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 21a2545..38d3bb1 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170	coreutils-8.24.tar.xz
+sha256	31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87	coreutils-8.25.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d8e2ee6..0d7b782 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.24
+COREUTILS_VERSION = 8.25
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
