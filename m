From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/rp-pppoe: add _CPE_ID_VENDOR
Message-ID: <20210420205903.A5961815BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=912342f8336cd9079df78f44ae016f0b40961331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rp-pppoe_project:rp-pppoe:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:rp-pppoe_project:rp-pppoe

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rp-pppoe/rp-pppoe.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 2f0073b6c0..ce85da11e4 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -8,6 +8,8 @@ RP_PPPOE_VERSION = 3.14
 RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
+RP_PPPOE_CPE_ID_VENDOR = rp-pppoe_project
+
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
 RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
