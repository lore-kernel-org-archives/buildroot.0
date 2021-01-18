From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:20 +0100
Subject: [Buildroot] [git commit] package/xen: add CPE variables
Message-ID: <20210118203943.E7A7B88530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d490802433ecb9edaa1f2424f6d9cdc6681c4943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:o:xen:xen is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Axen%3Axen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xen/xen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index cb1ea23ba6..3a758b7b20 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,6 +8,8 @@ XEN_VERSION = 4.14.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
+XEN_CPE_ID_VENDOR = xen
+XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
 
 # Calculate XEN_ARCH
