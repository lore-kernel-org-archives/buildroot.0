From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:10:15 +0100
Subject: [Buildroot] [git commit] package/jasper: bump version to 2.0.27
Message-ID: <20210320205105.BBDB4884BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34743fadbad6537dabb9ebd99cb010d9e99510c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
  * Check for an image containing no samples in the PGX
    decoder. (#271, #272, #273, #274, #275, #276, #281)
  * Check for dimensions of zero in the JPC and JPEG decoders.
  * Fix an arguably incorrect type for an integer literal
    in the PGX decoder. (#270)
  * Check for an invalid component reference in the
    JP2 decoder. (#269)
  * Check on integer size in JP2 decoder. (#278)

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index c1f1b4f602..17260b00c9 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a82a119e85b7d1f448e61309777fa5f79053a9adca4a2b5bfe44be5439fb8fea  jasper-2.0.26.tar.gz
+sha256  df41bd015a9dd0cc2a2e696f8ca5cbfb633323ca9429621f7fa801778681f2dd  jasper-2.0.27.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b9cbe5749b..e7bb08e200 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.26
+JASPER_VERSION = 2.0.27
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
