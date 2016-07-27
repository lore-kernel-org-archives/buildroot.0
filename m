From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:31:42 +0200
Subject: [Buildroot] [git commit] fmlib: bump to fsl-sdk-v2.0
Message-ID: <20160727193318.59A0881E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d73aef112c07d988022a57e45d2c1b6e1e1717a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmlib/fmlib.hash | 2 ++
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
new file mode 100644
index 0000000..3746695
--- /dev/null
+++ b/package/fmlib/fmlib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa	fmlib-fsl-sdk-v2.0.tar.gz
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 405ee14..42cdc27 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v1.8
+FMLIB_VERSION = fsl-sdk-v2.0
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
 FMLIB_LICENSE = BSD-3c, GPLv2+
 FMLIB_LICENSE_FILES = COPYING
