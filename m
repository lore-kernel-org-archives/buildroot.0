From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:11:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/json-for-modern-cpp: add _CPE_ID_VENDOR
Message-ID: <20210426125912.C10F686340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e52089addf852cad68e57d43f92296b2842bceb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:json-for-modern-cpp_project:json-for-modern-cpp:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:json-for-modern-cpp_project:json-for-modern-cpp

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr:move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c24fc9042a8b52e0749cd957c6f91f2bdf1d3eaf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 6e21723fd4..ffc419e6d1 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -9,6 +9,8 @@ JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
 JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
+JSON_FOR_MODERN_CPP_CPE_ID_VENDOR = json-for-modern-cpp_project
+
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
 # header only library
 JSON_FOR_MODERN_CPP_INSTALL_TARGET = NO
