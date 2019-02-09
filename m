From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Feb 2019 12:41:52 +0100
Subject: [Buildroot] [git commit] package/libopenssl: renumber patches
Message-ID: <20190209114745.E35968847B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1ff0c0786a8953bdcadd778e75449638f485588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...path.patch => 0002-Reproducible-build-do-not-leak-compiler-path.patch} | 0
 ...ch => 0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch} | 0
 ...ch => 0004-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)

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
