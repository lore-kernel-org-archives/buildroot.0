From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:04:19 +0200
Subject: [Buildroot] [git commit] ndisc6: add license information
Message-ID: <20140625211214.21B6C9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a4d6efb4f9b912374c1187858105f8850a2c8c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/ndisc6.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 719f85d..257289d 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -9,6 +9,8 @@ NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
+NDISC6_LICENSE = GPLv2 or GPLv3
+NDISC6_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 NDISC6_DEPENDENCIES += gettext
