From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 16:32:29 +0000
Subject: [Buildroot] [PATCH next] ser2net: bump version to 3.2
Message-ID: <20161117163229.3816-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Notes to the maintainer:
 - ser2net was bumped to 3.1 in master branch (autobuilder fixes) but
   not in next branch. This patch will cause a conflict when merging
   next into master after the 2016.11 release.
---
 package/ser2net/ser2net.hash | 2 +-
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 3e62f1c..1b93643 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 e8aaf6c629c78bbc424e8a6810758061f9c68a4ffea0faf7c5031de26ce1c3e1  ser2net-3.0.tar.gz
+sha256 e91cf85ab2c1769e17be7726b133f8f3ad197e9d4b445bb0b0d2f3f97f88a083  ser2net-3.2.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 01aee95..8090c06 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.0
+SER2NET_VERSION = 3.2
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.10.1
