From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Dec 2012 14:36:28 -0300
Subject: [Buildroot] [PATCH 3/3] sed: bump to version 4.2.2
In-Reply-To: <1356543388-23649-1-git-send-email-gustavo@zacarias.com.ar>
References: <buildroot@busybox.net>
 <1356543388-23649-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356543388-23649-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sed/sed.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 451ba54..5535754 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -3,9 +3,11 @@
 # sed
 #
 #############################################################
-SED_VERSION = 4.2.1
-SED_SOURCE = sed-$(SED_VERSION).tar.gz
+
+SED_VERSION = 4.2.2
 SED_SITE = $(BR2_GNU_MIRROR)/sed
+SED_LICENSE = GPLv3
+SED_LICENSE_FILES = COPYING
 
 SED_CONF_OPT = --bindir=/usr/bin \
 		--libdir=/lib \
-- 
1.7.8.6
