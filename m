From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 08:58:25 +0100
Subject: [Buildroot] [git commit] execline: bump version to 2.3.0.4
Message-ID: <20171215075847.02E8980F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00db41451be36f3ce9c6deee78a2e3a9fecc84de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 1251d8d..79ea5ba 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 1a698425740a410a38be770f98b8faf94c633e29a74ba1d25adddbb294e979f5  execline-2.3.0.3.tar.gz
+sha256 e4bb8fc8f20cca96f4bac9f0f74ebce5081b4b687bb11c79c843faf12507a64b  execline-2.3.0.4.tar.gz
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index a4f4229..68131b8 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.3.0.3
+EXECLINE_VERSION = 2.3.0.4
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
