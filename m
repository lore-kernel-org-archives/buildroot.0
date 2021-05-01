From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:48:48 +0200
Subject: [Buildroot] [git commit] package/s6-linux-utils: bump to version
 2.5.1.5
Message-ID: <20210501144021.53E358650B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=340f47b6490f0e60bbb8083dd3f39f0e681f5212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change hash file indentation to 2 spaces.

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-linux-utils/s6-linux-utils.hash | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 64caef793d..27e7eb7b7a 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 d8ad8dcc8d805646b655971ddcaabcd50094d8347bd49d859ba2c51713fbfd09  s6-linux-utils-2.5.1.4.tar.gz
-sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  c300dbf36b533083f82c6827830c55ce34bfc6cd493c782f207d199669a345ba  s6-linux-utils-2.5.1.5.tar.gz
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index dcc4f9e4b2..c050a231c2 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.1.4
+S6_LINUX_UTILS_VERSION = 2.5.1.5
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
