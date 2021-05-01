From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:48:03 +0200
Subject: [Buildroot] [git commit] package/s6-portable-utils: bump to version
 2.2.3.2
Message-ID: <20210501144021.397AA861EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92fb4ed491de119c88393c64fb85909b223f4cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change hash file indentation to 2 spaces.

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-portable-utils/s6-portable-utils.hash | 4 ++--
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index 0e594d8b02..dd9f7df4bd 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 43e68a9abec873b337baeee92075a1c2e22cdfffd595cb91475fdcb10b6441cf  s6-portable-utils-2.2.3.1.tar.gz
-sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  6627a2d3ea263539e83512a36f10a587fa0dd5e899bc3612187e9e3b9faf769c  s6-portable-utils-2.2.3.2.tar.gz
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 9da165b49b..b4bed5212d 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.3.1
+S6_PORTABLE_UTILS_VERSION = 2.2.3.2
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
