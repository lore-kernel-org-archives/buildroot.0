From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 10:21:01 +0100
Subject: [Buildroot] [PATCH 1/2] nano: switch to official site
Message-ID: <1466760062-31676-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/nano/nano.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index be6ea24..0ed35b9 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.5.3
-NANO_SITE = $(BR2_GNU_MIRROR)/nano
+NANO_VERSION_MAJOR = 2.5
+NANO_VERSION = $(NANO_VERSION_MAJOR).3
+NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
 NANO_CONF_OPTS = \
-- 
2.7.3
