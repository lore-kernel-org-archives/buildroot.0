From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:12:54 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/waf: add license
Message-ID: <20201114130012.63AEF85F60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a173f9d586b2994b2911abd8178205732ff102b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c77548fa93e159572e71d4cb2208ab0706aea11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/waf/waf.hash | 1 +
 package/waf/waf.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 15db32f384..afca0f31bf 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha1  92212071a63ce38fdfd69fb8332f04e84d1f6635  waf-2.0.20
 sha256  bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f  waf-2.0.20
+sha256  bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 56b6d9e033..9c5e72d9eb 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -7,6 +7,8 @@
 WAF_VERSION = 2.0.20
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
+WAF_LICENSE = BSD-3-Clause
+WAF_LICENSE_FILES = waf
 
 define HOST_WAF_EXTRACT_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
