From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Oct 2013 17:21:58 -0300
Subject: [Buildroot] [PATCH 2/2] linphone: bump to version 3.6.1
In-Reply-To: <1381177318-16998-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381177318-16998-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381177318-16998-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because of the previous mediastreamer bump (because of the untested ortp
bump) we need to bump linphone as well to avoid build failures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/linphone.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.5
