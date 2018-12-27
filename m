From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 13:10:44 +0200
Subject: [Buildroot] [PATCH] tmux: bump to version 2.8
Message-ID: <bd48f5e4578d612e0c32d92c132d58f5078d7a54.1545909044.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove README from license files. The Buildroot generated image does not
use the source files that README mentioned. README states that other
files "have a license and copyright notice at their start", which
doesn't add much information.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tmux/tmux.hash | 3 +--
 package/tmux/tmux.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 27a3ccaaeb61..306dc52c33a5 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,4 +1,3 @@
 # Locally computed:
-sha256 9ded7d100313f6bc5a87404a4048b3745d61f2332f99ec1400a7c4ed9485d452  tmux-2.7.tar.gz
-sha256 59ad3f5d323cb6b97bb3882c454e6176519cd580b2d4db43c5161517385569f1  README
+sha256 7f6bf335634fafecff878d78de389562ea7f73a7367f268b66d37ea13617a2ba  tmux-2.8.tar.gz
 sha256 ce75f1345a76c93bd0f413d1b93ff1baa0669f34a7242779a00c1b862b4f813a  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index deae99717b6a..8b7a96e89809 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.7
+TMUX_VERSION = 2.8
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
-TMUX_LICENSE_FILES = README COPYING
+TMUX_LICENSE_FILES = COPYING
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
-- 
2.19.2
