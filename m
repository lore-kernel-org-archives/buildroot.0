From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:56 -0300
Subject: [Buildroot] [PATCH 50/54] gptfdisk: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-50-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gptfdisk/gptfdisk.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 22bf180..6835f40 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -6,6 +6,8 @@
 
 GPTFDISK_VERSION = 0.8.6
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
+GPTFDISK_LICENSE = GPLv2+
+GPTFDISK_LICENSE_FILES = COPYING
 
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
-- 
1.8.5.5
