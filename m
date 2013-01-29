From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:24:37 +0100
Subject: [Buildroot] [git commit] tn5250: add license information
Message-ID: <20130129223112.D4A089A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc1d0c3d47aee2d178c74454c2404f85ccde2554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tn5250/tn5250.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index f43f847..7b16eb1 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -8,6 +8,8 @@ TN5250_VERSION = 0.17.4
 TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
 TN5250_MAKE_OPT = CPPFLAGS=""
 TN5250_DEPENDENCIES = ncurses
+TN5250_LICENSE = LGPLv2.1+
+TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	TN5250_CONF_OPT += --with-ssl
