From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Feb 2019 11:11:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: renumber patches
Message-ID: <20190209101139.13168-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ch => 0002-Reproducible-build-do-not-leak-compiler-path.patch} | 0
 ...03-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch} | 0
 ...04-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libopenssl/{0003-Reproducible-build-do-not-leak-compiler-path.patch => 0002-Reproducible-build-do-not-leak-compiler-path.patch} (100%)
 rename package/libopenssl/{0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch => 0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch} (100%)
 rename package/libopenssl/{0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch => 0004-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch} (100%)

diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
similarity index 100%
rename from package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
rename to package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
diff --git a/package/libopenssl/0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
similarity index 100%
rename from package/libopenssl/0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
rename to package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
diff --git a/package/libopenssl/0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch b/package/libopenssl/0004-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch
similarity index 100%
rename from package/libopenssl/0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch
rename to package/libopenssl/0004-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch
-- 
2.20.1
