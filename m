From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 20 Jul 2015 08:53:52 +0200
Subject: [Buildroot] [PATCH 1/1] c-icap-modules: fix license typos
Message-ID: <1437375232-2696-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/c-icap-modules/c-icap-modules.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 27c57e1..aeab580 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -7,8 +7,8 @@
 C_ICAP_MODULES_VERSION = 0.3.2
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap/
-C_ICAP_MODULES_LICENCE = GPLv2+
-C_ICAP_MODULES_LICENCE_FILE = COPYING
+C_ICAP_MODULES_LICENSE = GPLv2+
+C_ICAP_MODULES_LICENSE_FILES = COPYING
 C_ICAP_MODULES_DEPENDENCIES = c-icap
 
 C_ICAP_MODULES_CONF_OPTS = \
-- 
1.9.1
