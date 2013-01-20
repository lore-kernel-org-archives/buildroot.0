From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:30 +0100
Subject: [Buildroot] [PATCH 1/8] axel: add license informations
Message-ID: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axel/axel.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 0ed8ad2..f823b4a 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -6,6 +6,8 @@
 AXEL_VERSION = 2.4
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
 AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
+AXEL_LICENSE = GPLv2+
+AXEL_LICENSE_FILES = COPYING
 
 AXEL_LDFLAGS = -lpthread
 
-- 
1.7.9.5
