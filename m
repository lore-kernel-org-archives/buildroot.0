From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:16:01 +0200
Subject: [Buildroot] [git commit] package/luksmeta: bump to version v9
Message-ID: <20190913201158.0E9938E108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8103460aa1afa86d607f985c559c6fce9f5ae517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a potential infinite loop when handling the LUKS
header:

git shortlog v8..v9
Daniel Kope??ek (2):
      Use asciidoc as the manual page source format
      Generate manual page from source during build time

Milan Broz (1):
      Fix infinite loop when initializing trimmed LUKS header.

Nathaniel McCallum (3):
      Fix invalid man page section reference
      Fix typos in the man page
      Release version 9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luksmeta/luksmeta.hash | 2 +-
 package/luksmeta/luksmeta.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
index f5d756405a..7e252294bb 100644
--- a/package/luksmeta/luksmeta.hash
+++ b/package/luksmeta/luksmeta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0154af98e7302a172060d83d24b6d87557a822c39ba3e911461bb1a6d3a22d51  luksmeta-8.tar.bz2
+sha256 2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
 sha256 4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
index 33671e469a..c8a19ddeeb 100644
--- a/package/luksmeta/luksmeta.mk
+++ b/package/luksmeta/luksmeta.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUKSMETA_VERSION = 8
+LUKSMETA_VERSION = 9
 LUKSMETA_SOURCE = luksmeta-$(LUKSMETA_VERSION).tar.bz2
 LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSMETA_VERSION)
 LUKSMETA_LICENSE = LGPL-2.1+
