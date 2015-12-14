From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:59 -0300
Subject: [Buildroot] [PATCH 20/45] minidlna: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/minidlna/minidlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index e00fa09..6902aa8 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -6,7 +6,7 @@
 
 MINIDLNA_VERSION = 1.1.5
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
-MINIDLNA_LICENSE = GPLv2 BSD-3c
+MINIDLNA_LICENSE = GPLv2, BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
-- 
2.4.10
