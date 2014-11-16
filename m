From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 15:00:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/openssl: rename patches to the new
	convention
In-Reply-To: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416146446-27060-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...openssl-001-do-not-build-docs.patch => 001-do-not-build-docs.patch} |    0
 ...002-dont-force-large-file.patch => 002-dont-force-large-file.patch} |    0
 ...n.patch => 003-cryptodev-Fix-issue-with-signature-generation.patch} |    0
 .../openssl/{openssl-004-musl-termios.patch => 004-musl-termios.patch} |    0
 .../{openssl-005-parallel-build.patch => 005-parallel-build.patch}     |    0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/openssl/{openssl-001-do-not-build-docs.patch => 001-do-not-build-docs.patch} (100%)
 rename package/openssl/{openssl-002-dont-force-large-file.patch => 002-dont-force-large-file.patch} (100%)
 rename package/openssl/{openssl-003-cryptodev-Fix-issue-with-signature-generation.patch => 003-cryptodev-Fix-issue-with-signature-generation.patch} (100%)
 rename package/openssl/{openssl-004-musl-termios.patch => 004-musl-termios.patch} (100%)
 rename package/openssl/{openssl-005-parallel-build.patch => 005-parallel-build.patch} (100%)

diff --git a/package/openssl/openssl-001-do-not-build-docs.patch b/package/openssl/001-do-not-build-docs.patch
similarity index 100%
rename from package/openssl/openssl-001-do-not-build-docs.patch
rename to package/openssl/001-do-not-build-docs.patch
diff --git a/package/openssl/openssl-002-dont-force-large-file.patch b/package/openssl/002-dont-force-large-file.patch
similarity index 100%
rename from package/openssl/openssl-002-dont-force-large-file.patch
rename to package/openssl/002-dont-force-large-file.patch
diff --git a/package/openssl/openssl-003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
similarity index 100%
rename from package/openssl/openssl-003-cryptodev-Fix-issue-with-signature-generation.patch
rename to package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
diff --git a/package/openssl/openssl-004-musl-termios.patch b/package/openssl/004-musl-termios.patch
similarity index 100%
rename from package/openssl/openssl-004-musl-termios.patch
rename to package/openssl/004-musl-termios.patch
diff --git a/package/openssl/openssl-005-parallel-build.patch b/package/openssl/005-parallel-build.patch
similarity index 100%
rename from package/openssl/openssl-005-parallel-build.patch
rename to package/openssl/005-parallel-build.patch
-- 
1.7.10.4
