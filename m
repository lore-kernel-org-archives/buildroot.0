From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:41:37 +0100
Subject: [Buildroot] [git commit] package/jq: set JQ_CPE_ID_VALID
Message-ID: <20210303122740.B7EB2815EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94a331ed1e9766331e673aaea10fdf50188a4816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jq_project:jq is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajq_project%3Ajq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
