From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 22 Nov 2013 15:15:12 +0000
Subject: [Buildroot] [PATCH 1/2] beecrypt: include sequence numbers in
	patche's names
Message-ID: <1385133313-27399-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...beecrypt-0001-cppglue.cxx-cplusplus-only.patch} |    0
 ...=> beecrypt-0002-icu-check-cross-compile.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/beecrypt/{beecrypt-cppglue.cxx-cplusplus-only.patch => beecrypt-0001-cppglue.cxx-cplusplus-only.patch} (100%)
 rename package/beecrypt/{beecrypt-icu-check-cross-compile.patch => beecrypt-0002-icu-check-cross-compile.patch} (100%)

diff --git a/package/beecrypt/beecrypt-cppglue.cxx-cplusplus-only.patch b/package/beecrypt/beecrypt-0001-cppglue.cxx-cplusplus-only.patch
similarity index 100%
rename from package/beecrypt/beecrypt-cppglue.cxx-cplusplus-only.patch
rename to package/beecrypt/beecrypt-0001-cppglue.cxx-cplusplus-only.patch
diff --git a/package/beecrypt/beecrypt-icu-check-cross-compile.patch b/package/beecrypt/beecrypt-0002-icu-check-cross-compile.patch
similarity index 100%
rename from package/beecrypt/beecrypt-icu-check-cross-compile.patch
rename to package/beecrypt/beecrypt-0002-icu-check-cross-compile.patch
-- 
1.7.1
