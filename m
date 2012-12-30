From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:57 +0100
Subject: [Buildroot] [git commit] efl/libeina: bump to version 1.7.4
Message-ID: <20121230112956.007C79A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cba182b99f625da169b1ca9643ed165463e2963
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeina/libeina.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index e5b89c1..d99a237 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEINA_VERSION = 1.1.0
+LIBEINA_VERSION = 1.7.4
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
 LIBEINA_LICENSE = LGPLv2.1+
