From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:14 -0300
Subject: [Buildroot] [PATCH 17/19] parted: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/parted/parted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 78c755a..773e332 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -9,5 +9,7 @@ PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = readline util-linux lvm2
 PARTED_INSTALL_STAGING = YES
+PARTED_LICENSE = GPLv3+
+PARTED_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.5
