From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Nov 2018 21:59:54 +0100
Subject: [Buildroot] [git commit] libsigrokdecode: bump version to 0.5.2
Message-ID: <20181202071556.063DC8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7ecc85d6e8fc5ab52a4a7cad449a6f30e47004a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrokdecode/libsigrokdecode.hash | 2 +-
 package/libsigrokdecode/libsigrokdecode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
index c2e15f61cb..e6eb4a080b 100644
--- a/package/libsigrokdecode/libsigrokdecode.hash
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	493d8b555ae4c245a5feebbd94de33aec7ee85a4f16bc3f4c3985961b459b51e  libsigrokdecode-0.5.1.tar.gz
+sha256	e08d9e797c54eccf3144da631b6e5f1498ac531e51520428df537a1da82583f0  libsigrokdecode-0.5.2.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index 8b4802a7f3..f509fbdf7e 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROKDECODE_VERSION = 0.5.1
+LIBSIGROKDECODE_VERSION = 0.5.2
 LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
 LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
