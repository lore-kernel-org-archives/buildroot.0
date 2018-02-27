From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:31 -0600
Subject: [Buildroot] [NEXT 16/26] iproute2: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-17-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/iproute2/iproute2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 15bb132..9d9fdb1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -11,6 +11,7 @@ IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
 IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
+IPROUTE2_CPE_ID = iproute2_project:$(IPROUTE2_NAME):$(IPROUTE2_VERSION)
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
-- 
1.9.1
