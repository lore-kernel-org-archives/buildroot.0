From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:29:51 +0200
Subject: [Buildroot] [git commit] log4cplus: bump to version 2.0.0
Message-ID: <20180508132941.B85668BE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd5a5ff64f482587ad4ac431f542b0c8f87ec8ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- LICENSE has been updated to add threadpool license (BSD-like)
- Add hash for license file

Fixes:
 - http://autobuild.buildroot.net/results/a4690fd3e46354776f6d6addd17226622c5f4961

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cplus/log4cplus.hash | 3 ++-
 package/log4cplus/log4cplus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index 395e9fe535..2f1d24a855 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  999427580cded403b4edc8a85088621f27493c489f08b9f564fb5fe76c16a883  log4cplus-1.1.2.tar.xz
+sha256  8c85e769c3dbec382ed4db91f15e5bc24ba979f810262723781f2fc596339bf4  log4cplus-2.0.0.tar.xz
+sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index b4a57c36c3..890d2ee8f5 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 1.1.2
+LOG4CPLUS_VERSION = 2.0.0
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
-LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause
+LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
