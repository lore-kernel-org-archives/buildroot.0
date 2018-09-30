From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:18:15 +0200
Subject: [Buildroot] [git commit] sg3_utils: bump to version 1.44
Message-ID: <20180930181808.D07AE8A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2474d96bbfaaa884eed21340de943e9414aa10b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix minor/major undefined error with glibc 2.28
- Add hash for license files

Fixes:
 - http://autobuild.buildroot.org/results/1d396e85d35f40478b4b09b4ff80eee395a2e3c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sg3_utils/sg3_utils.hash | 6 +++++-
 package/sg3_utils/sg3_utils.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index a884063f4f..14b94947d4 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,2 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256	97aeed65894feb2add896b4adfa4cf343966c8a61c7d206795ed0507640ee7b9	sg3_utils-1.42.tar.xz
+sha256	ca94ac106510742cd8ff5ead4a7e5c89d410653291401daf4632d2bef2a35b05	sg3_utils-1.44.tar.xz
+
+# Hash for license files
+sha256	d516b8b337a77e3d4c65dffe708ca7fb25b1cb4ec77ec362cf11ed659b9250bc	COPYING
+sha256	31f6d59679e0fb21c9358f22484e6e3c53e20ef08c0950fd38a4a867cb55edc9	BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 88827f33b4..0c17b30cde 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.42
+SG3_UTILS_VERSION = 1.44
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3-Clause (library)
