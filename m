From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:04:37 +0100
Subject: [Buildroot] [git commit] package/znc: add ZNC_CPE_ID_VENDOR
Message-ID: <20210121205057.05B1C80DF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c362882cd45ae404c359445e5c17b973181c1e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:znc:znc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aznc%3Aznc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/znc/znc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 799efa8dc7..52a8d78aeb 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -8,6 +8,7 @@ ZNC_VERSION = 1.8.2
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
+ZNC_CPE_ID_VENDOR = znc
 ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
