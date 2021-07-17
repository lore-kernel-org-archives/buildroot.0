From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:01:20 +0200
Subject: [Buildroot] [git commit] package/linuxptp: add
 LINUXPTP_CPE_ID_VENDOR
Message-ID: <20210717072813.51C6091088@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9d3dd830585610b1253ad66f921fab0ad059fda4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:linuxptp_project:linuxptp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxptp_project%3Alinuxptp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxptp/linuxptp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index da23631d20..048dd0b896 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -9,6 +9,7 @@ LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
+LINUXPTP_CPE_ID_VENDOR = linuxptp_project
 
 LINUXPTP_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
