From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:41:45 +0200
Subject: [Buildroot] [git commit] aumix: needs host-gettext
Message-ID: <20130403204840.DF8959B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1087713131132f2db92865a730a326f8b6e7a39a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fff0ddfd7cebe6535f506be41d09c6e64290f93a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/aumix/aumix.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
