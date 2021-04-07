From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:14:42 +0200
Subject: [Buildroot] [git commit] package/s6-portable-utils: bump to version
 2.2.3.1
Message-ID: <20210407185256.B6BC7825B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4376edb2d0381beb91b72509896181b18771bea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to year change.

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1515:mhcdpginfgieagphalne

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-portable-utils/s6-portable-utils.hash | 4 ++--
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index 83823b3438..0e594d8b02 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 1e473224350c6ebedd7adf162b68303e2e0a32ca2e99d7afee7573d9e78f931c  s6-portable-utils-2.2.2.1.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 43e68a9abec873b337baeee92075a1c2e22cdfffd595cb91475fdcb10b6441cf  s6-portable-utils-2.2.3.1.tar.gz
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 8b60bf43e3..9da165b49b 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.2.1
+S6_PORTABLE_UTILS_VERSION = 2.2.3.1
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
