From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:41:09 +0100
Subject: [Buildroot] [git commit] package/rpm: add RPM_CPE_ID_VENDOR
Message-ID: <20210303122740.9BB8F815EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cdab4fc4ae7484895429305eea8ccec99c7d726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rpm:rpm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arpm%3Arpm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 351ae0994f..350a38264b 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -19,6 +19,7 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
+RPM_CPE_ID_VENDOR = rpm
 # We're patching configure.ac
 RPM_AUTORECONF = YES
 
