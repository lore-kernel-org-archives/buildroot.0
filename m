From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:41 -0600
Subject: [Buildroot] [NEXT 26/26] xerces: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-27-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/xerces/xerces.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index a25641f..153b8eb 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -9,6 +9,7 @@ XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
+XERCES_CPE_ID = apache:$(XERCES_NAME)-c\+\+:$(XERCES_VERSION)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPTS = \
 	--disable-threads \
-- 
1.9.1
