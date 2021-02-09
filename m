From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Tue,  9 Feb 2021 11:05:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/waf: bump to v2.0.22
Message-ID: <20210209100546.216140-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 1e74b74d63..e9d387e7d0 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  b7f38d2987433ee6e0f4a75ecec8807575176e1e  waf-2.0.21
-sha256  7cebf2c5efe53cbb9a4b5bdc4b49ae90ecd64a8fce7a3222d58e591b58215306  waf-2.0.21
+sha1  494ada411468129ed229f946ecec3048400e320b  waf-2.0.22
+sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf-2.0.22
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  7cebf2c5efe53cbb9a4b5bdc4b49ae90ecd64a8fce7a3222d58e591b58215306  waf
+sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index dd97519b57..5cc0dc3714 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.21
+WAF_VERSION = 2.0.22
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.25.3
