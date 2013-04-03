From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:31:58 -0300
Subject: [Buildroot] [PATCH] aumix: needs host-gettext
Message-ID: <1364985118-29571-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fff0ddfd7cebe6535f506be41d09c6e64290f93a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/aumix/aumix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index 130bda0..da42bba 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -16,6 +16,6 @@ AUMIX_CONF_OPT = \
 	--without-gpm \
 	--without-sysmouse
 
-AUMIX_DEPENDENCIES = ncurses
+AUMIX_DEPENDENCIES = host-gettext ncurses
 
 $(eval $(autotools-package))
-- 
1.8.1.5
