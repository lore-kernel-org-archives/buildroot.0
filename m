From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Jan 2015 22:09:53 +0100
Subject: [Buildroot] [PATCH 4/6] lsqlite3: bump to version 0.9.3
In-Reply-To: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1421442595-27575-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index b611d70..db65ae5 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.1-2
-LSQLITE3_SUBDIR = lsqlite3_fsl09t
+LSQLITE3_VERSION = 0.9.3-0
+LSQLITE3_SUBDIR = lsqlite3_fsl09w
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
-- 
2.1.0
