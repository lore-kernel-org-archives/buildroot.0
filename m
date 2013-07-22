From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 22 Jul 2013 07:20:36 +0200
Subject: [Buildroot] [PATCH 1/1] udisks: fix typos in license info
Message-ID: <1374470436-3504-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/udisks/udisks.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 5d3368d..28855dd 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -6,8 +6,8 @@
 
 UDISKS_VERSION = 1.0.4
 UDISKS_SITE    = http://hal.freedesktop.org/releases/
-UDISKS_LICENCE = GPLv2+
-UDISKS_LICENCE_FILES = COPYING
+UDISKS_LICENSE = GPLv2+
+UDISKS_LICENSE_FILES = COPYING
 
 UDISKS_DEPENDENCIES = 	\
 	sg3_utils	\
-- 
1.7.9.5
