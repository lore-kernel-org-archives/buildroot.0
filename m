From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:47:41 +0200
Subject: [Buildroot] [git commit] package/sqlite: security bump version to
 3.28.0
Message-ID: <20190513184330.C442389173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde99db79a6801e1e6fe48cf75cab65d5860c351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.sqlite.org/releaselog/3_28_0.html

Fixes https://nvd.nist.gov/vuln/detail/CVE-2019-5018

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 5e2bc7030a..9b7efe71d6 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 5f5750e3f39b7b60394a2fb6ddb2371f848670e6  sqlite-autoconf-3270200.tar.gz
+sha1 01b9d8fc77085e144dddc87456c9783e53d09a53  sqlite-autoconf-3280000.tar.gz
 # Calculated based on the hash above
-sha256 50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e  sqlite-autoconf-3270200.tar.gz
+sha256 d61b5286f062adfce5125eaf544d495300656908e61fca143517afcc0a89b7c3  sqlite-autoconf-3280000.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 95ededd8c4..7e97c966b7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3270200
+SQLITE_VERSION = 3280000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2019
 SQLITE_LICENSE = Public domain
