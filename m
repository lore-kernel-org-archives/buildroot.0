From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:56 +0100
Subject: [Buildroot] [git commit] efl/libefreet: bump to version 1.7.4
Message-ID: <20121230112955.AE59C9A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba13ffec1c1cde217cf9b6ed5660a9d96cba3e03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libefreet/libefreet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index c0d7397..b23a5a5 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFREET_VERSION = 1.1.0
+LIBEFREET_VERSION = 1.7.4
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases/
 LIBEFREET_LICENSE = BSD-2c
