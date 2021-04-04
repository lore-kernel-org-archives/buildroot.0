From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:29:10 +0200
Subject: [Buildroot] [git commit] package/jasper: bump version to 2.0.28
Message-ID: <20210404100458.A94968776E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7727703a8bd7589f8c1cf4fe47242214707cac50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
  * Fix potential null pointer dereference in the JP2/JPC decoder. (#269)
  * Fix ignoring of JAS_STREAM_FILEOBJ_NOCLOSE at stream close time. (#286)
  * Fix integral type sizing problem in JP2 codec. (#284)
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 17260b00c9..67653a8e88 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df41bd015a9dd0cc2a2e696f8ca5cbfb633323ca9429621f7fa801778681f2dd  jasper-2.0.27.tar.gz
+sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index e7bb08e200..6ef1afcac7 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.27
+JASPER_VERSION = 2.0.28
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
