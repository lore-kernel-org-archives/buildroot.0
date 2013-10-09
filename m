From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:34:04 +0200
Subject: [Buildroot] [git commit] libnetfilter_cttimeout: correct license
	GPLv2 -> GPLv2+
Message-ID: <20131009194411.7919F9B99E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2816432be0f9d83fd59b6c84b38d6e7dfc2ac64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libnetfilter-cttimeout.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
index c1f1016..cf55255 100644
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_ctt
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
-LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2
+LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
