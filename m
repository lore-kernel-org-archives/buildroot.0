From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 19:10:30 -0300
Subject: [Buildroot] [PATCHv2] libevent: add license information
Message-ID: <1403647830-11924-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libevent/libevent.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5
