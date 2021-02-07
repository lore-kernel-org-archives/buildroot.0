From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:41:06 +0100
Subject: [Buildroot] [git commit] package/openrc: set OPENRC_CPE_ID_VALID
Message-ID: <20210207092050.6B5E67FAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c33272d952d680a3a72e9c3d6528360fc079f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:openrc_project:openrc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenrc_project%3Aopenrc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openrc/openrc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index ba1691e70f..e9e35c4d13 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -8,6 +8,7 @@ OPENRC_VERSION = 0.42.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
+OPENRC_CPE_ID_VALID = YES
 
 # 0007-checkpath-fix-CVE-2018-21269.patch
 OPENRC_IGNORE_CVES += CVE-2018-21269
