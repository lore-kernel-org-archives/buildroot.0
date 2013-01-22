From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:49 -0300
Subject: [Buildroot] [PATCH 4/8] tar: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tar/tar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index c1e625f..e465bfa 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -6,6 +6,8 @@
 
 TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
+TAR_LICENSE = GPLv3+
+TAR_LICENSE_FILES = COPYING
 
 # Prefer full-blown tar over buybox's version
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.12.4
