From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:03 -0300
Subject: [Buildroot] [PATCH 05/13] setserial: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/setserial/setserial.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index f8d0a4b..9f28216 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-SETSERIAL_VERSION            = 2.17
-SETSERIAL_PATCH              = setserial_2.17-45.3.diff.gz
-SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE               = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
+SETSERIAL_VERSION = 2.17
+SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
+SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
+SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
+SETSERIAL_LICENSE = GPLv2
+SETSERIAL_LICENSE_FILES = debian/copyright
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
-- 
1.8.5.5
