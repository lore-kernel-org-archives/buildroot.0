From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  8 Aug 2011 13:58:10 +0200
Subject: [Buildroot] [PATCH 2/2] util-linux: disable NLS
In-Reply-To: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1312804690-21977-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d34759b..9f9d2a8 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -11,7 +11,7 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkg-config
 
-UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
+UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown --disable-nls
 
 # If both util-linux and busybox are selected, make certain util-linux
 # wins the fight over who gets to have their utils actually installed
-- 
1.7.4.1
