From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:19:07 +0200
Subject: [Buildroot] [git commit] package/dillo: renumber patches
Message-ID: <20200827211713.0C27D818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb90b946a465003da919028b4cae028e3b525f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../dillo/{0002-usr-local-include.patch => 0001-usr-local-include.patch}  | 0
 ...{0003-Fix-openssl-detection.patch => 0002-Fix-openssl-detection.patch} | 0
 ...{0004-Support-OpenSSL-1.1.0.patch => 0003-Support-OpenSSL-1.1.0.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)

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
