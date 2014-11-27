From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 22:28:48 +0100
Subject: [Buildroot] [PATCH 3/4 v2] package/nfs-utils: rename patches
In-Reply-To: <cover.1417123680.git.yann.morin.1998@free.fr>
References: <cover.1417123680.git.yann.morin.1998@free.fr>
Message-ID: <20a61c88c9f634faccbe68de35df09f79078f944.1417123680.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...tch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} | 0
 ...2-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} | 0
 ...of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} | 0
 ...-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} | 0
 ...ch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} | 0
 ...ch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} | 0
 ...def-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename package/nfs-utils/{nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0002-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} (100%)

diff --git a/package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch b/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
rename to package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
diff --git a/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
rename to package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
diff --git a/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
rename to package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
diff --git a/package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch b/package/nfs-utils/0004-fix-build-with-uClibc.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
rename to package/nfs-utils/0004-fix-build-with-uClibc.patch
diff --git a/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch b/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
rename to package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
diff --git a/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
rename to package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
diff --git a/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch b/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch
rename to package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
-- 
1.9.1
