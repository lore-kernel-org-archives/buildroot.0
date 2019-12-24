From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:50:13 +0100
Subject: [Buildroot] [git commit] package/log4cplus: bump to version 2.0.5
Message-ID: <20191224124116.9FE898E1B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335df9d983b401b8579781ab7d519d6e2f577b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index ea95cc46eb..43ff401da6 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  faf15f3651e2d0f9f9cf2c1bfcb38ec4962f22f4a671410453a27c0976da5e36  log4cplus-2.0.4.tar.xz
+sha256  6046f0867ce4734f298418c7b7db0d35c27403090bb751d98e6e76aa4935f1af  log4cplus-2.0.5.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index d3a19b6b9b..eadc5ec948 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.4
+LOG4CPLUS_VERSION = 2.0.5
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
