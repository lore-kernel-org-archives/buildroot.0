From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:26:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/jq: set JQ_CPE_ID_VALID
Message-ID: <20210303092641.468797-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jq_project:jq is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajq_project%3Ajq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jq/jq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index f3a0493b89..0aab55d089 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,6 +8,7 @@ JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
 JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
+JQ_CPE_ID_VALID = YES
 JQ_INSTALL_STAGING = YES
 
 # currently using git version directly
-- 
2.30.0
