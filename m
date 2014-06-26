From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 13:50:47 +0200
Subject: [Buildroot] [git commit] libevent: add license information
Message-ID: <20140626115219.48A9E9CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cb5166eb5bcad98b4b840c1d7d96dd8942f1cfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 14ebf72..73be502 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -8,6 +8,8 @@ LIBEVENT_VERSION = 2.0.21
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
+LIBEVENT_LICENSE = BSD-3c, OpenBSD
+LIBEVENT_LICENSE_FILES = LICENSE
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
