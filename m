From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 11:48:04 +0100
Subject: [Buildroot] [git commit] socat: security bump to version 2.0.0-b7
Message-ID: <20140311104938.377769BF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=442f13779ec07a0c9716b04461becf5381205999
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0019.
Also rename patch according to policy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tion.patch => socat-001-no-documentation.patch} |    0
 package/socat/socat.mk                             |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socat/socat-no-documentation.patch b/package/socat/socat-001-no-documentation.patch
similarity index 100%
rename from package/socat/socat-no-documentation.patch
rename to package/socat/socat-001-no-documentation.patch
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index df60961..6ae67a9 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b6
+SOCAT_VERSION = 2.0.0-b7
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_LICENSE = GPLv2
