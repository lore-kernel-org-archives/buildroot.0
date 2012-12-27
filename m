From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Dec 2012 12:39:07 -0300
Subject: [Buildroot] [PATCH 3/6] smartmontools: bump to version 6.0
In-Reply-To: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356622750-20657-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/smartmontools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 7b4c7f9..5736771 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 5.43
+SMARTMONTOOLS_VERSION = 6.0
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
1.7.8.6
