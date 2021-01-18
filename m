From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:48:57 +0100
Subject: [Buildroot] [git commit] package/mutt: add MUTT_CPE_ID_VENDOR
Message-ID: <20210118203943.28826805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f155076f7eea8a631ba33850fbd2fef78bf5a4dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mutt:mutt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amutt%3Amutt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 67fc4ed838..0823e8afc0 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -8,6 +8,7 @@ MUTT_VERSION = 1.14.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
+MUTT_CPE_ID_VENDOR = mutt
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
