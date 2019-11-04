From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:39:47 +0100
Subject: [Buildroot] [git commit] package/s6-portable-utils: bump version to
 2.2.2.1
Message-ID: <20191104213334.F26798E74B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66266dc01da9f45e5f24e866b60f352f252faf7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-portable-utils/s6-portable-utils.hash | 2 +-
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index 266d89ed15..83823b3438 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 0503841a2aee1cd79122c9ecf49dbefad5c5d21be7114e83e71c210e106abf0a  s6-portable-utils-2.2.2.0.tar.gz
+sha256 1e473224350c6ebedd7adf162b68303e2e0a32ca2e99d7afee7573d9e78f931c  s6-portable-utils-2.2.2.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 5f6e02de70..8b60bf43e3 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.2.0
+S6_PORTABLE_UTILS_VERSION = 2.2.2.1
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
