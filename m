From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Mon,  6 Aug 2012 10:21:22 +0800
Subject: [Buildroot]  [PATCH 3/3] input-event-daemon: Add license info
In-Reply-To: <1344219682-8544-1-git-send-email-keguang.zhang@gmail.com>
References: <1344219682-8544-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <1344219682-8544-3-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license info for input-event-daemon.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/input-event-daemon/input-event-daemon.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 0683056..f99bfbe 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -6,6 +6,8 @@
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
 INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
+INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
 define INPUT_EVENT_DAEMON_BUILD_CMDS
 	touch  $(@D)/input-event-table.h
-- 
1.7.1
