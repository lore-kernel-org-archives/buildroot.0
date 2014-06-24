From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:47 -0300
Subject: [Buildroot] [PATCH 41/54] sysprof: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-41-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysprof/sysprof.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 4f6ed54..0650781 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -7,6 +7,8 @@
 SYSPROF_VERSION = 1.2.0
 SYSPROF_SITE = http://sysprof.com
 SYSPROF_DEPENDENCIES = libglib2
+SYSPROF_LICENSE = GPLv2+
+SYSPROF_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
 SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
-- 
1.8.5.5
