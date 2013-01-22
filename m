From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:46 -0300
Subject: [Buildroot] [PATCH 1/8] dosfstools: add license information
Message-ID: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 507f485..4f89364 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -6,6 +6,8 @@
 
 DOSFSTOOLS_VERSION = 3.0.12
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
+DOSFSTOOLS_LICENSE = GPLv3+
+DOSFSTOOLS_LICENSE_FILES = COPYING
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
-- 
1.7.12.4
