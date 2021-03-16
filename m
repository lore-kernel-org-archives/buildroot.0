From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:15:21 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/gnuchess:
 security bump to version 6.2.7
Message-ID: <20210316205316.22C7788075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68b2095a89add05f2fed671e366418320994fdda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fix CVE-2019-15767: In GNU Chess 6.2.5, there is a stack-based buffer
overflow in the cmd_load function in frontend/cmd.cc via a crafted chess
position in an EPD file.

Update indentation in hash file (two spaces)

https://lists.gnu.org/archive/html/info-gnu-chess/2020-04/msg00000.html
https://lists.gnu.org/archive/html/info-gnu-chess/2020-05/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5d9fb6a2ae94238c7b5a80e9d780c162023ba7e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/gnuchess.hash | 4 ++--
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 9342fc3eb7..1641a7d8f9 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 9a99e963355706cab32099d140b698eda9de164ebce40a5420b1b9772dd04802  gnuchess-6.2.5.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e536675a61abe82e61b919f6b786755441d9fcd4c21e1c82fb9e5340dd229846  gnuchess-6.2.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 4d91706de4..d6cf98a2b8 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.5
+GNUCHESS_VERSION = 6.2.7
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
