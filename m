From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:12:53 -0300
Subject: [Buildroot] [PATCH 04/13] dosfstools: bump to version 3.0.11
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 8e6cfc9..c2d763d 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,7 +3,7 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION = 3.0.10
+DOSFSTOOLS_VERSION = 3.0.11
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
 DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
 MKDOSFS_BINARY = mkdosfs
-- 
1.7.2.2
