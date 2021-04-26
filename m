From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:59:45 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/iputils: add
 _CPE_ID_VENDOR
Message-ID: <20210426125912.B47D28138F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c26a3cb266f0edba14a8a20139524a9d88aac3bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:iputils_project:iputils:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:iputils_project:iputils

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5ba5e631fa6be4c0db1eed16fd51b3000c8241ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
