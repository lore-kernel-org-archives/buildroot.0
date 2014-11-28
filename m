From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Nov 2014 16:09:39 +0000
Subject: [Buildroot] [PATCH branch/next] pinentry: bump version to 0.9.0
Message-ID: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 0.9.0
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pinentry/pinentry.hash |    2 ++
 package/pinentry/pinentry.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/pinentry/pinentry.hash

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
new file mode 100644
index 0000000..851c721
--- /dev/null
+++ b/package/pinentry/pinentry.hash
@@ -0,0 +1,2 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  f8e5c774c35fbb91d84e82559baf76f6b4513236  pinentry-0.9.0.tar.bz2
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 39358a7..56e8e71 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 0.8.3
+PINENTRY_VERSION = 0.9.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
-- 
1.7.1
