From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:45:53 +0200
Subject: [Buildroot] [git commit] libssh: normalize header separator size to
	80
Message-ID: <20150929174639.8A99781D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f64256d1f7ffa836ce8b0792cac5aaeed245a32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh/libssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 39cff50..ded5e8c 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -2,7 +2,7 @@
 #
 ## libssh
 #
-#################################################################################
+################################################################################
 
 LIBSSH_VERSION = 0.7.1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
