From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 16:55:36 +0200
Subject: [Buildroot] [git commit] linphone: bump to version 3.6.1
Message-ID: <20131008150944.260429B930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4c05314a5e2ae5756f91b567c1795d4b73f7243
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because of the previous mediastreamer bump (because of the untested ortp
bump) we need to bump linphone as well to avoid build failures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linphone/linphone.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 2ff678b..6fa1487 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LINPHONE_VERSION = 3.5.2
-LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
+LINPHONE_VERSION = 3.6.1
+LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.6.x/sources
 LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
