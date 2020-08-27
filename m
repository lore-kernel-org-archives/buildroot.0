From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Aug 2020 18:27:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/dillo: renumber patches
Message-ID: <20200827162746.121015-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...{0002-usr-local-include.patch => 0001-usr-local-include.patch} | 0
 ...x-openssl-detection.patch => 0002-Fix-openssl-detection.patch} | 0
 ...pport-OpenSSL-1.1.0.patch => 0003-Support-OpenSSL-1.1.0.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/dillo/{0002-usr-local-include.patch => 0001-usr-local-include.patch} (100%)
 rename package/dillo/{0003-Fix-openssl-detection.patch => 0002-Fix-openssl-detection.patch} (100%)
 rename package/dillo/{0004-Support-OpenSSL-1.1.0.patch => 0003-Support-OpenSSL-1.1.0.patch} (100%)

diff --git a/package/dillo/0002-usr-local-include.patch b/package/dillo/0001-usr-local-include.patch
similarity index 100%
rename from package/dillo/0002-usr-local-include.patch
rename to package/dillo/0001-usr-local-include.patch
diff --git a/package/dillo/0003-Fix-openssl-detection.patch b/package/dillo/0002-Fix-openssl-detection.patch
similarity index 100%
rename from package/dillo/0003-Fix-openssl-detection.patch
rename to package/dillo/0002-Fix-openssl-detection.patch
diff --git a/package/dillo/0004-Support-OpenSSL-1.1.0.patch b/package/dillo/0003-Support-OpenSSL-1.1.0.patch
similarity index 100%
rename from package/dillo/0004-Support-OpenSSL-1.1.0.patch
rename to package/dillo/0003-Support-OpenSSL-1.1.0.patch
-- 
2.28.0
