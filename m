From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:36:01 +0200
Subject: [Buildroot] [git commit] package/batctl: bump version to 2020.2
Message-ID: <20200712195446.865738539E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76974fefb7d6722b31a6384c85f0f687d2d0f1c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batctl/batctl.hash | 10 +++++-----
 package/batctl/batctl.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 94f3de0230..e8127aa26f 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,6 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2019.3/batctl-2019.3.tar.gz.sha1
-sha1 3a1357d51e9338e79e9953b7d8b33ace9f904b30  batctl-2019.3.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2020.2/batctl-2020.2.tar.gz.sha1
+sha1  e347fb126e2a8f6d21516296325afc043062e3bd  batctl-2020.2.tar.gz
 # Locally calculated
-sha256 2bd93fa14925a8dc63a67e64266c8ccd2fa3ac44b10253d93e6f8a630350070c  batctl-2019.3.tar.gz
-sha256 cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
-sha256 323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
+sha256  d29cdb53ee68abd5027eae07d9fd645b3f154e0d577efa2666c1334bb6d60efd  batctl-2020.2.tar.gz
+sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 17ed15e36d..229c042aaf 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2019.3
+BATCTL_VERSION = 2020.2
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
