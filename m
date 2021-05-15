From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 May 2021 08:45:22 +0200
Subject: [Buildroot] [git commit branch/next] package/gnuchess: bump to
 version 6.2.8
Message-ID: <20210515061658.189B386F32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cb36ff7707d7b591b2896b089ce2f6c76a99275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.gnu.org/archive/html/info-gnu-chess/2021-05/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 1641a7d8f9..b68eb6e0ee 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  e536675a61abe82e61b919f6b786755441d9fcd4c21e1c82fb9e5340dd229846  gnuchess-6.2.7.tar.gz
+sha256  d50446cda8012240321da39cddbb4df4d08458a8d538a4738882814139583847  gnuchess-6.2.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 60327dfe06..29d3590849 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.7
+GNUCHESS_VERSION = 6.2.8
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
