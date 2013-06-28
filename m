From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:01 -0300
Subject: [Buildroot] [PATCH 04/19] cups: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cups/cups.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 9b8d7c5..8a761a3 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -7,6 +7,8 @@
 CUPS_VERSION = 1.3.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
+CUPS_LICENSE = GPLv2 LGPLv2
+CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-- 
1.8.1.5
