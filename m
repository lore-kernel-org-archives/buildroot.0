From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2013 08:59:37 +0100
Subject: [Buildroot] [git commit] coreutils: belongs to system tools,
	not development
Message-ID: <20131203081319.9B2049BEEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e89e2154c82dfb320721b8ddd2f3f87543e85e30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5b9d775..101c088 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,9 +86,6 @@ source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
 source "package/bustle/Config.in"
 source "package/ccache/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/coreutils/Config.in"
-endif
 source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/diffutils/Config.in"
@@ -957,6 +954,7 @@ source "package/acl/Config.in"
 source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
+source "package/coreutils/Config.in"
 endif
 source "package/cpuload/Config.in"
 source "package/dsp-tools/Config.in"
