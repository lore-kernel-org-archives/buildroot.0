From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:30 -0500
Subject: [Buildroot] [PATCH 09/25] package/libcap: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-9-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libcap_project:libcap:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libcap_project:libcap

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
-- 
2.17.1
