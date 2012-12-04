From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 13:56:24 -0800
Subject: [Buildroot] [git commit] midori: add license information
Message-ID: <20121204215926.5EC4499951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01263a085d222b4c39b6ab8c4ac5d4b70f69f1c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <simond@trainfx.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/midori/midori.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 44cce40..8fac3d8 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -7,6 +7,8 @@
 MIDORI_VERSION = 0.4.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
+MIDORI_LICENSE = LGPLv2.1+
+MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-pkgconf \
