From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  9 Jan 2021 08:41:23 +0100
Subject: [Buildroot] [PATCH] package/readline: bump to version 8.1
Message-ID: <20210109074123.2202-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/readline/readline.hash | 4 ++--
 package/readline/readline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index 560154c2f..63172f112 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461  readline-8.0.tar.gz
+sha256  f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02  readline-8.1.tar.gz
 
 # Hash for license file
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index f5d7d5bf9..e48055133 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.0
+READLINE_VERSION = 8.1
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
-- 
2.27.0
