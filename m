From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:50:09 +0200
Subject: [Buildroot] [git commit] package/jasper: bump to version 2.0.20
Message-ID: <20200919194420.3418287038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a108bbf38ea7d5491134d0746aa33a8f2d422eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump JasPer to 2.0.20

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 67ad90d730..05cf5fc34e 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b9d16162a088617ada36450f2374d72165377cb64b33ed197c200bcfb73ec76c  jasper-2.0.19.tar.gz
+sha256 d55843ce52afa9bfe90f30118329578501040f30d48a027459a68a962695e506  jasper-2.0.20.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index f6ae2ead78..9bf7d49971 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.19
+JASPER_VERSION = 2.0.20
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
