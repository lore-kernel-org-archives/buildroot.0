From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:14:56 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: Bump to version 20170929
Message-ID: <20171007210734.3EFE480E30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d583756faefad31b7103e71f886fcde60dbc549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 68b9523..42feaad 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20170516/ltp-full-20170516.tar.xz.sha1
-sha1 bd5210b73b14708c88449089a3a3c64ace3cd22a  ltp-full-20170516.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20170929/ltp-full-20170929.tar.xz.sha1
+sha1 a170db3bc7203c9a998a277a369e7020dc61a382  ltp-full-20170929.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index eb9453a..bbeee5b 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20170516
+LTP_TESTSUITE_VERSION = 20170929
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
