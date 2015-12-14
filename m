From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:54 -0300
Subject: [Buildroot] [PATCH 15/45] omniorb: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/omniorb/omniorb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index bf5ba47..aaf3bf3 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -8,7 +8,7 @@ OMNIORB_VERSION = 4.2.0
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-OMNIORB_LICENSE = GPL2+ LGPLv2.1+
+OMNIORB_LICENSE = GPL2+, LGPLv2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
-- 
2.4.10
