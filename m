From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:17:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/rng-tools: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.62907817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b41ed4b42b4ee65cc2d4c27cc8e49b93bdda9ea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:rng-tools_project:rng-tools:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:rng-tools_project:rng-tools

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c44be545f654cfa7fd9c1a2f95cccf85d998c04c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rng-tools/rng-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index ae20d96362..dbb7353b8c 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -8,6 +8,8 @@ RNG_TOOLS_VERSION = 6.11
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),V$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
+RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
+
 RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
