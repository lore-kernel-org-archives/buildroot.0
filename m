From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:12:00 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/make: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.00128817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83959780186aeb5939de6f480cc72e72d25a4a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnu:make:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:make

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c15daccf1e08c6a8e46dece220cd59443ad7b91f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/make/make.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/make/make.mk b/package/make/make.mk
index 10082353a2..f289c5c3d9 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -10,6 +10,8 @@ MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
+MAKE_CPE_ID_VENDOR = gnu
+
 # Patching configure.ac
 MAKE_AUTORECONF = YES
 
