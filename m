From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:33:56 +0100
Subject: [Buildroot] [git commit] openjpeg: security bump to version 2.1.2
Message-ID: <20161114213401.8DB0B819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eac8c9ee2439fb4a43c9cef5371ae268489cd185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See CHANGELOG.md for the full list of fixes, including security issues.

See CVE number lists at [1] and [2].

[1] http://advisories.mageia.org/MGASA-2016-0362.html
[2] https://lists.fedoraproject.org/archives/list/package-announce at lists.fedoraproject.org/thread/HPMDEUIMHTLKMHELDL4F4HZ7X4Y34JEB/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 35d4fbd..c0abd0c 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4afc996cd5e0d16360d71c58216950bcb4ce29a3272360eb29cadb1c8bce4efc  openjpeg-2.1.tar.gz
+sha256	4ce77b6ef538ef090d9bde1d5eeff8b3069ab56c4906f083475517c2c023dfa7  openjpeg-2.1.2.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index bf12526..ca22068 100644
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
