From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Dec 2014 10:56:25 +0100
Subject: [Buildroot] [PATCH 1/3] fconfig: change upstream site
Message-ID: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream site is dead, used http://sources.buildroot.net
temporarly.

Fixes:

  http://autobuild.buildroot.org/results/778/77899f882e04121ca5f2b96f0df9f24ead26d12b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fconfig/fconfig.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 3a846f4..7f7faad 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -5,7 +5,9 @@
 ################################################################################
 
 FCONFIG_VERSION = 20080329
-FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
+# Real upstream location has been disabled
+# FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
+FCONFIG_SITE = http://sources.buildroot.net
 FCONFIG_LICENSE = GPLv2+
 FCONFIG_LICENSE_FILES = fconfig.c
 
-- 
2.1.0
