From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:26:52 +0100
Subject: [Buildroot] [git commit] aumix: add licensing info
Message-ID: <20131211213618.BD16B9A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c04bce8d0488a4233b6d4acc8421a392c590a328
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aumix/aumix.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index de0902a..a55588f 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -8,6 +8,8 @@ AUMIX_VERSION = 2.8
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF = YES
+AUMIX_LICENSE = GPLv2+
+AUMIX_LICENSE_FILES = COPYING
 
 AUMIX_CONF_OPT = \
 	--without-gtk \
