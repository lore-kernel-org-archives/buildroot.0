From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 17:55:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/musl: add
 MUSL_CPE_ID_VENDOR
Message-ID: <20210523160324.9749980235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b71075861229b6528c4f8b797a8f97b29017a120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:musl-libc:musl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amusl-libc%3Amusl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8ac2e592c0ada30887a99082851de204d8b807c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 82b3eeaf52..d4f26b50a7 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -8,6 +8,7 @@ MUSL_VERSION = 1.2.2
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
+MUSL_CPE_ID_VENDOR = musl-libc
 
 # Before musl is configured, we must have the first stage
 # cross-compiler and the kernel headers
