From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Apr 2021 22:34:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/libcgroup: add
 LIBCGROUP_CPE_ID_VENDOR
In-Reply-To: <20210416203413.1603113-1-fontaine.fabrice@gmail.com>
References: <20210416203413.1603113-1-fontaine.fabrice@gmail.com>
Message-ID: <20210416203413.1603113-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libcgroup_project:libcgroup is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibcgroup_project%3Alibcgroup

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcgroup/libcgroup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index ff0639946c..156b066162 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,6 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
+LIBCGROUP_CPE_ID_VENDOR = libcgroup_project
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
-- 
2.30.2
