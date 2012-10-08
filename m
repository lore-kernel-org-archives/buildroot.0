From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Oct 2012 19:01:05 -0300
Subject: [Buildroot] [PATCH 4/4] patch: bump to version 2.7.1
In-Reply-To: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349733665-2584-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/patch.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 346aabd..badc431 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PATCH_VERSION = 2.7
+PATCH_VERSION = 2.7.1
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
 PATCH_LICENSE_FILE = COPYING
-- 
1.7.8.6
