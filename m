From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Sep 2020 13:11:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/mcelog: bump to version 172
In-Reply-To: <20200919111138.367874-1-francois.perrad@gadz.org>
References: <20200919111138.367874-1-francois.perrad@gadz.org>
Message-ID: <20200919111138.367874-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mcelog/mcelog.hash | 4 ++--
 package/mcelog/mcelog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index dea97eb42..49f29e244 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 11c0f9ab9c97e12d912a51d2b4d2ee937378c5b08a3bb4e34214e0736c6fb7ef  mcelog-168.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  d21dfddaaa8e6f4ebd59ce353165c8d8079d0d5ed563492a0415af2248d8b3a5  mcelog-172.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 9fbbbfb4d..c24366546 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 168
+MCELOG_VERSION = 172
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
-- 
2.25.1
