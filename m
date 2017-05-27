From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:25:57 +0200
Subject: [Buildroot] [git commit] package/avrdude: bump to
	f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
Message-ID: <20170601202857.7A02582863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de54bff40345afc1553246a3e535f27a8635d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index b2c6125..b203d4d 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b32128f4812d5e852cfba2e863d950ec30e0f72f09bc14fb41c02528bbc5dd18 avrdude-ad04c429a90f4c34f000ea4ae11db2705915a31f.tar.gz
+sha256 cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index c379707..0e34076 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = ad04c429a90f4c34f000ea4ae11db2705915a31f
+AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
