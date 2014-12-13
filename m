From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Dec 2014 20:34:03 +0200
Subject: [Buildroot] [PATCH 1/2] pcre: rename patches to new convention
Message-ID: <65f6d701d05bfb6c2cce52beef094c5674bdfa06.1418495644.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pcre/{pcre-01-no-compat.patch => 0001-no-compat.patch}       | 0
 package/pcre/{pcre-02-no-cpp-tests.patch => 0002-no-cpp-tests.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/pcre/{pcre-01-no-compat.patch => 0001-no-compat.patch} (100%)
 rename package/pcre/{pcre-02-no-cpp-tests.patch => 0002-no-cpp-tests.patch} (100%)

diff --git a/package/pcre/pcre-01-no-compat.patch b/package/pcre/0001-no-compat.patch
similarity index 100%
rename from package/pcre/pcre-01-no-compat.patch
rename to package/pcre/0001-no-compat.patch
diff --git a/package/pcre/pcre-02-no-cpp-tests.patch b/package/pcre/0002-no-cpp-tests.patch
similarity index 100%
rename from package/pcre/pcre-02-no-cpp-tests.patch
rename to package/pcre/0002-no-cpp-tests.patch
-- 
2.1.3
