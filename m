From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 27 Apr 2021 20:19:32 +0200
Subject: [Buildroot] [PATCH] package/fmt: get rid of extra space
Message-ID: <20210427181932.5284-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 32c10f256bbc3dd09a72d45107682afb4448f07b
introduced extra space so let's remove that in
order to be consistent with other variables.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/fmt/fmt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 7ea7b9d69c..332957982f 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -9,7 +9,7 @@ FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
-FMT_CPE_ID_VENDOR  = fmt
+FMT_CPE_ID_VENDOR = fmt
 FMT_INSTALL_STAGING = YES
 
 FMT_CONF_OPTS = \
-- 
2.31.1
