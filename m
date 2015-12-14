From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:05 -0300
Subject: [Buildroot] [PATCH 26/45] keyutils: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/keyutils/keyutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 3d6697e..7a30ba6 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -7,7 +7,7 @@
 KEYUTILS_VERSION = 1.5.9
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE = GPLv2+ LGPLv2.1+
+KEYUTILS_LICENSE = GPLv2+, LGPLv2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
-- 
2.4.10
