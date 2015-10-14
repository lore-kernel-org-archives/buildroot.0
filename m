From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:27:22 +0200
Subject: [Buildroot] [git commit] cloog: bump to version 0.18.4
Message-ID: <20151014202725.5B831819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=371086828902b1c713e5ef9ad9ee3e3d1798802b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloog/cloog.hash |    2 +-
 package/cloog/cloog.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloog/cloog.hash b/package/cloog/cloog.hash
index 72a5b65..7368c9e 100644
--- a/package/cloog/cloog.hash
+++ b/package/cloog/cloog.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	460c6c740acb8cdfbfbb387156b627cf731b3837605f2ec0001d079d89c69734	cloog-0.18.3.tar.gz
+sha256	325adf3710ce2229b7eeb9e84d3b539556d093ae860027185e7af8a8b00a750e	cloog-0.18.4.tar.gz
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index 4b02cd4..4c8b4c1 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOOG_VERSION = 0.18.3
+CLOOG_VERSION = 0.18.4
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
 CLOOG_LICENSE = LGPLv2.1+
 CLOOG_DEPENDENCIES = gmp isl
