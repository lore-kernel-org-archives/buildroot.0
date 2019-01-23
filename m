From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 22:50:23 +0100
Subject: [Buildroot] [git commit] package/inadyn: bump version to 2.5
Message-ID: <20190123215314.09DFE8E383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c18a3001b8afbfbd39160e1727805c3ec39f619f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.hash | 6 +++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 742b6f226f..2691ba0ef9 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.3/inadyn-2.3.tar.xz.md5
-md5 63efb284b7f3f389c01bad19ee28407e  inadyn-2.3.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.5/inadyn-2.5.tar.xz.md5
+md5 8a864d5186e54d24de2d7554fc01b3ec  inadyn-2.5.tar.xz
 # Locally computed
-sha256 4a98b80d8565b9e4cb32b19b7a8b06a22a7d9a6f4f03a5298a8d441b6187c760  inadyn-2.3.tar.xz
+sha256 4a9ad208671f62912428413da0282450b2d2c4da38f3c95c4ac975d048c41fcd  inadyn-2.5.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 0b1f82dae8..96a37d4768 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.3
+INADYN_VERSION = 2.5
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
