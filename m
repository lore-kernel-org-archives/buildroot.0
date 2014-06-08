From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 13:50:17 +0200
Subject: [Buildroot] [git commit] spawn-fcgi: bump to version 1.6.4
Message-ID: <20140608115048.D87399CF06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d48b6aeae11e5313ca41aaf2d0fbccb5575be60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spawn-fcgi/spawn-fcgi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 670daf7..d3f8c99 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPAWN_FCGI_VERSION = 1.6.3
+SPAWN_FCGI_VERSION = 1.6.4
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 SPAWN_FCGI_LICENSE = BSD-3c
