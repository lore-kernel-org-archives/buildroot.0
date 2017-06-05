From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:13:47 +0200
Subject: [Buildroot] [git commit] package/granite: bump version to 0.4.1
Message-ID: <20170605091447.8FFB57FDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f8e75dbbbcf0bb3080f730152fc7fad5957f739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/granite/granite.hash | 6 +++---
 package/granite/granite.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index e073307..b9ed287 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,4 +1,4 @@
-# From https://launchpad.net/granite/0.4/0.4.0.1/+download/granite-0.4.0.1.tar.xz/+md5
-md5	db41150ca6e77162392362686e848086	granite-0.4.0.1.tar.xz
+# From https://launchpad.net/granite/0.4/0.4.1/+download/granite-0.4.1.tar.xz/+md5
+md5 b1002c0488bb9ade0ef89730c4f84393 granite-0.4.1.tar.xz
 # Calculated based on the hash above
-sha256	95a142a8befeedc35a089d638e759b657905508dc3007036d6c1fa3efe94c4dd	granite-0.4.0.1.tar.xz
+sha256 8bb411523e6cd5685c928dbfe08893892189cedf9fad5f537aa76182032cf09c  granite-0.4.1.tar.xz
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index 4ad64c2..f824ba7 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GRANITE_VERSION_MAJOR = 0.4
-GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).0.1
+GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).1
 GRANITE_SITE = https://launchpad.net/granite/$(GRANITE_VERSION_MAJOR)/$(GRANITE_VERSION)/+download
 GRANITE_SOURCE = granite-$(GRANITE_VERSION).tar.xz
 GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
