From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:41:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/mutt: add MUTT_CPE_ID_VENDOR
Message-ID: <20210117164119.354055-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mutt:mutt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amutt%3Amutt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 72cfd3daf5..815749cf7e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -8,6 +8,7 @@ MUTT_VERSION = 2.0.3
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
+MUTT_CPE_ID_VENDOR = mutt
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
-- 
2.29.2
