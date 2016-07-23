From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:41:04 +0200
Subject: [Buildroot] [git commit] dropbear: bump version to 2016.74
Message-ID: <20160723124120.9728E818EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b06ebbcffd0905cf8cf26673453bd619194d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to https://matt.ucc.asn.au/dropbear/CHANGES there were some
severe security issues fixed.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 2692889..88f3e6e 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	5c61a4f69b093b688629cd365be38701485ff63cfb23642dab7a05ad250aefd7  dropbear-2016.73.tar.bz2
+sha256 2720ea54ed009af812701bcc290a2a601d5c107d12993e5d92c0f5f81f718891 dropbear-2016.74.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 32e2167..743d524 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2016.73
+DROPBEAR_VERSION = 2016.74
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
