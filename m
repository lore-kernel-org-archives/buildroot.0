From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:38:16 +0200
Subject: [Buildroot] [git commit] gamin: define license
Message-ID: <20130628195144.8CCDB9B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc6c2babb9a2edc087c6fee790702a06ff377c1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 7939992..c7ec531 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -9,7 +9,8 @@ GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
-
+GAMIN_LICENSE = LGPLv2+
+GAMIN_LICENSE_FILES = COPYING
 GAMIN_CONF_OPT = --disable-debug
 
 # python support broken
