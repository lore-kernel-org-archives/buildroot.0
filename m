From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 29 Dec 2015 09:13:35 +0100
Subject: [Buildroot] [PATCH 1/1] eventlog: add EVENTLOG_VERSION_MAJOR
	variable
Message-ID: <1451376815-21691-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/eventlog/eventlog.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
index c4e5fd9..76da002 100644
--- a/package/eventlog/eventlog.mk
+++ b/package/eventlog/eventlog.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-EVENTLOG_VERSION = 0.2.12
+EVENTLOG_VERSION_MAJOR = 0.2
+EVENTLOG_VERSION = $(EVENTLOG_VERSION_MAJOR).12
 EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
-EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/0.2
+EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/$(EVENTLOG_VERSION_MAJOR)
 EVENTLOG_LICENSE = BSD-3c
 EVENTLOG_LICENSE_FILES = COPYING
 EVENTLOG_INSTALL_STAGING = YES
-- 
1.9.1
