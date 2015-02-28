From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 28 Feb 2015 18:14:13 +0000
Subject: [Buildroot] [PATCH] alsa-lib: bump version to 1.0.29
Message-ID: <1425147253-12974-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.0.29
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/alsa-lib/alsa-lib.hash |    2 ++
 package/alsa-lib/alsa-lib.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/alsa-lib/alsa-lib.hash

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
new file mode 100644
index 0000000..d5807cf
--- /dev/null
+++ b/package/alsa-lib/alsa-lib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0  alsa-lib-1.0.29.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 16d184e..f5ede52 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.0.28
+ALSA_LIB_VERSION = 1.0.29
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
-- 
1.7.1
