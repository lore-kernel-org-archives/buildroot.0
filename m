From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:02:01 +0100
Subject: [Buildroot] [git commit] package/apparmor: add
 APPARMOR_CPE_ID_VENDOR
Message-ID: <20210121204358.E434F88F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=791b14a18244441c31636437ae52d83d00745752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:canonical:apparmor is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acanonical%3Aapparmor

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 7ea0fabd91..7819d0b7af 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -11,6 +11,7 @@ APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPAR
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
+APPARMOR_CPE_ID_VENDOR = canonical
 
 APPARMOR_DEPENDENCIES = libapparmor
 
