From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Nov 2016 22:47:43 +0200
Subject: [Buildroot] [PATCH] openjpeg: security bump to version 2.1.2
Message-ID: <08339f7ad87912d98912f4c52268b6c79ffd515c.1479156463.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See CHANGELOG.md for the full list of fixes, including security issues.

See CVE number lists at [1] and [2].

[1] http://advisories.mageia.org/MGASA-2016-0362.html
[2] https://lists.fedoraproject.org/archives/list/package-announce at lists.fedoraproject.org/thread/HPMDEUIMHTLKMHELDL4F4HZ7X4Y34JEB/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 35d4fbd5350e..c0abd0c54d7c 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4afc996cd5e0d16360d71c58216950bcb4ce29a3272360eb29cadb1c8bce4efc  openjpeg-2.1.tar.gz
+sha256	4ce77b6ef538ef090d9bde1d5eeff8b3069ab56c4906f083475517c2c023dfa7  openjpeg-2.1.2.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index bf125261a7fe..ca22068113a3 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.1
-OPENJPEG_SITE = $(call github,uclouvain,openjpeg,version.$(OPENJPEG_VERSION))
+OPENJPEG_VERSION = 2.1.2
+OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2c
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
-- 
2.10.2
