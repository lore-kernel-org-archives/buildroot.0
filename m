From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 16:38:35 +0200
Subject: [Buildroot] [PATCH 1/1] boot/edk2: add EDK2_CPE_ID_VENDOR
Message-ID: <20210612143835.522308-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tianocore:edk2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atianocore%3Aedk2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/edk2/edk2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 903fdfb89e..fabd0c5b45 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -9,6 +9,7 @@ EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause
 EDK2_LICENSE_FILE = License.txt
+EDK2_CPE_ID_VENDOR = tianocore
 EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
 EDK2_INSTALL_IMAGES = YES
-- 
2.30.2
