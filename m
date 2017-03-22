From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:51 +0530
Subject: [Buildroot] [PATCH 2/6] dbus-triggerd: add license file
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490204935-13172-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In absence of license file, use source file as a license file since it
has license header in comments.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/dbus-triggerd/dbus-triggerd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
index 48d5fb2..0d693b4 100644
--- a/package/dbus-triggerd/dbus-triggerd.mk
+++ b/package/dbus-triggerd/dbus-triggerd.mk
@@ -7,6 +7,7 @@
 DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
 DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
 DBUS_TRIGGERD_LICENSE = GPLv2+
+DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
 DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
 
 define DBUS_TRIGGERD_BUILD_CMDS
-- 
2.6.2
