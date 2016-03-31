From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:02:35 +0200
Subject: [Buildroot] [git commit] gnupg2: bump to version 2.0.30
Message-ID: <20160331190241.2A38E81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab0d80c7cc51b44aaee66dbec1b9d4854d6855f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash | 6 ++++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 1219338..67f7d9d 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00001.html
-sha1 87eb0df18f9953675f979405a1af10ab6c5322b3  gnupg-2.0.29.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q1/000385.html
+sha1	a9f024588c356a55e2fd413574bfb55b2e18794a	gnupg-2.0.30.tar.bz2
+# Calculated based on the hash above
+sha256	e329785a4f366ba5d72c2c678a7e388b0892ac8440c2f4e6810042123c235d71	gnupg-2.0.30.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 8d4f373..763e945 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.29
+GNUPG2_VERSION = 2.0.30
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
