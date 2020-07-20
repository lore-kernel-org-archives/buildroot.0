From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 09:15:08 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libmicrohttpd:
 security bump version to 0.9.71
Message-ID: <20200720071306.D46DF86D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436624e5eccb9a97035478f8a850593e4121bd9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Removed patch which was applied upstream, reformatted hashes.

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2020-06/msg00013.html

"This release fixes a potential buffer overflow and is thus considered a
security release. Please upgrade as soon as possible."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a9a554cfce7a713fc58b52075d1cf3bb7ef4279)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 4 ++--
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 0fc451fcde..d853f67a76 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 90d0a3d396f96f9bc41eb0f7e8187796049285fabef82604acd4879590977307  libmicrohttpd-0.9.70.tar.gz
-sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
+sha256  e8f445e85faf727b89e9f9590daea4473ae00ead38b237cf1eda55172b89b182  libmicrohttpd-0.9.71.tar.gz
+sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f47d7ec214..4d4b1ae1ac 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.70
+LIBMICROHTTPD_VERSION = 0.9.71
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
