From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 21:55:11 +0100
Subject: [Buildroot] [git commit] package/waf: add license
Message-ID: <20201112205658.0C86081680@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c77548fa93e159572e71d4cb2208ab0706aea11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
