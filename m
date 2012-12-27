From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Dec 2012 18:56:01 +0100
Subject: [Buildroot] [git commit] gawk: bump to version 4.0.2
Message-ID: <20121227175705.33BB880D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b307de4f9d6ae806b7cbbf8bc1d412d139d75cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/gawk.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 58c96ce..4a21592 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.1
+GAWK_VERSION = 4.0.2
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
+GAWK_LICENSE = GPLv3
+GAWK_LICENSE_FILES = COPYING
 
 # Prefer full-blown gawk over busybox awk
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
