From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Sun, 02 Aug 2020 19:21:41 +0000
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump version to 1.4
Message-ID: <NfT_XpKiCHDCCiBVFkk25JUShSDz3ArDljSA7jF0kvxo6FplXmifMtIttp3DwQ9yKmvD0RBaxNGB3YIgByqid2ieQmec5GwI0f2fa9YjjUg=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index b73eb60d86..51f37f6cb8 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.3.tar.xz.asc
-sha256  4f6144447254753fcd19f2c5c70e79fa91d27253185b8928436f01528aa65e6c  rauc-1.3.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.4.tar.xz.asc
+sha256  85aabf214cd93a37f7ad0b3aaad89eb94facf0f3ebf6e2edca945acbca9b0967  rauc-1.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 5c5bd993ba..1915c783aa 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-RAUC_VERSION = 1.3
+RAUC_VERSION = 1.4
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
--
2.20.1
