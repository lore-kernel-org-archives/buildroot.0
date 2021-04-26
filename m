From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:11:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libcap: add
 _CPE_ID_VENDOR
Message-ID: <20210426125912.CD9718138F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d1b9e4826d64d891801b424af167c8f72676bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libcap_project:libcap:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libcap_project:libcap

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74637c6e6f93dc0e8338f4831899e5c7e86448f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index d3a069e82a..79a130b453 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -9,6 +9,7 @@ LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
+LIBCAP_CPE_ID_VENDOR = libcap_project
 
 LIBCAP_DEPENDENCIES = host-libcap host-gperf
 LIBCAP_INSTALL_STAGING = YES
