From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:30:04 +0200
Subject: [Buildroot] [git commit] libnetfilter_cthelper: correct license
	GPLv2 -> GPLv2+
Message-ID: <20131009194411.704B09B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cd02296be5c3a1f5247fc634d98a1784313bd9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main file of this package is src/libnetfilter_cthelper.c, which states
GPLv2+.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libnetfilter_cthelper/libnetfilter-cthelper.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
index f3e892b..2cac8a2 100644
--- a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthe
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTHELPER_AUTORECONF = YES
-LIBNETFILTER_CTHELPER_LICENSE = GPLv2
+LIBNETFILTER_CTHELPER_LICENSE = GPLv2+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
