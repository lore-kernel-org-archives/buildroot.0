From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:37:21 +0100
Subject: [Buildroot] [git commit] package/openssl: rename patches to the new
	convention
Message-ID: <20141201104836.514117FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=924d832cb46033a0cedb7ec32153ff705ad9f799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uild-docs.patch => 001-do-not-build-docs.patch} |    0
 ...-file.patch => 002-dont-force-large-file.patch} |    0
 ...odev-Fix-issue-with-signature-generation.patch} |    0
 ...4-musl-termios.patch => 004-musl-termios.patch} |    0
 4 files changed, 0 insertions(+), 0 deletions(-)

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
