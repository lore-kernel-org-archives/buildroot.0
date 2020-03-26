From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:30:04 +0100
Subject: [Buildroot] [git commit] package/inadyn: bump version to 2.7
Message-ID: <20200326212348.14FE08837B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=556d27458c0918c3a2b07f14647a352d189bc0ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/inadyn/inadyn.hash | 6 +++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 52bd6abd38..8480e449ca 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,6 +1,6 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.6/inadyn-2.6.tar.xz.md5
-md5  62ec986b73d24b1b755bf0ed3efe54f2  inadyn-2.6.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.7/inadyn-2.7.tar.xz.md5
+md5  3ab125df504a9755264a9ebeedbfa4de  inadyn-2.7.tar.xz
 
 # Locally computed
-sha256  9f4198764abbd2798472b349d8867e86b4692c76ee304f1f9c607f67c9b582a4  inadyn-2.6.tar.xz
+sha256  eb03bc9d9c09dfbbc651b43a2eb5a967d0454a8293576df23784710dac50c6a4  inadyn-2.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index b1ebeeb2fe..7888f5a360 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.6
+INADYN_VERSION = 2.7
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
