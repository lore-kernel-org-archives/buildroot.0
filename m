From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:16:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpdecimal: bump version to 2.4.2
Message-ID: <20191104071619.18972-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.bytereef.org/mpdecimal/changelog.html

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpdecimal/mpdecimal.hash | 4 +++-
 package/mpdecimal/mpdecimal.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index bc443d1cd9..e152243230 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,2 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256 da74d3cfab559971a4fbd4fb506e1b4498636eb77d0fd09e44f8e546d18ac068 mpdecimal-2.4.1.tar.gz
+sha256 83c628b90f009470981cf084c5418329c88b19835d8af3691b930afccb7d79c7 mpdecimal-2.4.2.tar.gz
+# Locally computed
+sha256 e384413a13f061a50f6fadceefc0f326c22d83c13ae94978e1f86d0468332c19 LICENSE.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 5e0929ee98..2d06d0f6b4 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.4.1
+MPDECIMAL_VERSION = 2.4.2
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
