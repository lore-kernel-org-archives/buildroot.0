From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 07:20:07 +0200
Subject: [Buildroot] [git commit] less: bump version to 444
Message-ID: <20111006064504.19A6F8E256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b426e34dbc6908774e311023e6b2e0e4c6817f84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

less-444 was released on 9 Jun 2011.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/less/less.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index d20c232..5f74f5c 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LESS_VERSION = 443
+LESS_VERSION = 444
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_DEPENDENCIES = ncurses
 
