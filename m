From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 08:30:51 +0200
Subject: [Buildroot] [git commit] bash: bump to version 4.4.18
Message-ID: <20180330063308.6752083E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6aa2bfd87fed698fa1d14cde21360cf2a187fff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.hash | 4 ++--
 package/bash/bash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 4e2e48f363..951bcf5850 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://ftp.gnu.org/gnu/bash/bash-4.4.12.tar.gz.sig
-sha256 57d8432be54541531a496fd4904fdc08c12542f43605a9202594fa5d5f9f2331	bash-4.4.12.tar.gz
+# http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz.sig
+sha256 604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23	bash-4.4.18.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index e9384911a0..b162d93188 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 4.4.12
+BASH_VERSION = 4.4.18
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 # Build after since bash is better than busybox shells
 BASH_DEPENDENCIES = ncurses readline host-bison \
