From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:47:15 +0100
Subject: [Buildroot] [PATCH 2/5] libxmlrpc: rename patches to the new
	convention
In-Reply-To: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419688038-15640-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...xmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} | 0
 ...2-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} | 0
 .../{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch}  | 0
 ...4-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libxmlrpc/{libxmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0002-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0004-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} (100%)

diff --git a/package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch
rename to package/libxmlrpc/0001-fix-gennmtab-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch
rename to package/libxmlrpc/0002-fix-non-cplusplus-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch b/package/libxmlrpc/0003-non-wchar-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch
rename to package/libxmlrpc/0003-non-wchar-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch
rename to package/libxmlrpc/0004-use-correct-curl-config.patch
-- 
2.1.0
