From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Oct 2012 10:09:18 -0300
Subject: [Buildroot] [PATCH] cifs-utils: bump to version 5.7
In-Reply-To: <buildroot@busybox.net>
References: <buildroot@busybox.net>
Message-ID: <1350392958-22883-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index cfa2b91..d208c87 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,4 +1,4 @@
-CIFS_UTILS_VERSION = 5.6
+CIFS_UTILS_VERSION = 5.7
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3
-- 
1.7.8.6
