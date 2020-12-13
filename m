From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:11:38 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/jasper: bump to
 version 2.0.21
Message-ID: <20201213095850.9CAB8815B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8848396f177af5d3ca33fcf0e02828a8cee9522d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c133b50b4e584b7e04f2db450f92096b9af307a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 05cf5fc34e..df8ac8c9c7 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d55843ce52afa9bfe90f30118329578501040f30d48a027459a68a962695e506  jasper-2.0.20.tar.gz
+sha256 2482def06dfaa33b8d93cbe992a29723309f3c2b6e75674423a52fc82be10418  jasper-2.0.21.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 9bf7d49971..1351efa563 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.20
+JASPER_VERSION = 2.0.21
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
