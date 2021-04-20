From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:22:29 +0200
Subject: [Buildroot] [git commit] package/iputils: add _CPE_ID_VENDOR
Message-ID: <20210420205903.10B9E815BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba5e631fa6be4c0db1eed16fd51b3000c8241ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:iputils_project:iputils:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:iputils_project:iputils

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iputils/iputils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 1ee64dabe4..715779a633 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -15,6 +15,7 @@ IPUTILS_VERSION = 20210202
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
+IPUTILS_CPE_ID_VENDOR = iputils_project
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
