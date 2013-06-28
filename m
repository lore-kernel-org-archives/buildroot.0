From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:20:28 +0200
Subject: [Buildroot] [git commit] ctorrent: define license
Message-ID: <20130628195140.B63449B287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8945ba9814a6378e0b575bc867a6e12be6ac1eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ctorrent/ctorrent.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index aebf123..65e327e 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -7,6 +7,8 @@
 CTORRENT_VERSION = dnh3.3.2
 CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
 CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_LICENSE = GPLv2
+CTORRENT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CTORRENT_CONF_OPT+=--with-ssl=yes
