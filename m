From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:25:04 +0100
Subject: [Buildroot] [git commit] wget: add host-pkgconf dependency
Message-ID: <20141210202513.E986A80168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca0a1844aed988969a85de590435deb48289ca0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uses pkgconfig since 1.16.1+ to find libraries.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index b19c987..bd8e378 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -7,6 +7,7 @@
 WGET_VERSION = 1.16.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_DEPENDENCIES = host-pkgconf
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
 
