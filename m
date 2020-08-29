From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:06:22 +0200
Subject: [Buildroot] [git commit] package/libidn: bump to version 1.36
Message-ID: <20200902161639.712E285EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e16680bbe4223a50fb7f79e2718c5784399060f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Extract from NEWS:
 - Fix unlikely memory leak in idna_to_unicode_4z4z().
 - Check codepoint validity in punycode_decode() and punycode_decode().
 - tld: Add U+00EF to .nl TLD table.
 - Indent code.
 - Translation fixes.
 - Update gnulib files.
 - API and ABI is backwards compatible with the previous version.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn/libidn.hash | 8 ++++----
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index f5ba311e90..0255a63950 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256	f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e	libidn-1.35.tar.gz
+sha256  14b67108344d81ba844631640df77c9071d9fb0659b080326ff5424e86b14038  libidn-1.36.tar.gz
 
 # Hash for license files:
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYINGv3
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSERv3
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYINGv3
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 601edcb57d..2df3437029 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.35
+LIBIDN_VERSION = 1.36
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
