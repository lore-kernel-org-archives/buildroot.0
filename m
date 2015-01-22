From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:10:06 -0500
Subject: [Buildroot] [PATCH 2/3] fix license file
In-Reply-To: <1421953807-8902-1-git-send-email-codehero@gmail.com>
References: <20150117193703.GB2827@tarshish>
 <1421953807-8902-1-git-send-email-codehero@gmail.com>
Message-ID: <1421953807-8902-2-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bender <codehero@gmail.com>
---
 package/benejson/benejson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 851b95e..45999ef 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -7,7 +7,7 @@
 BENEJSON_VERSION = 0.9.7
 BENEJSON_SITE =  $(call github,codehero,benejson,$(BENEJSON_VERSION))
 BENEJSON_LICENSE = BSD-3c
-BENEJSON_LICENSE_FILES = COPYING
+BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
 
 BENEJSON_DEPENDENCIES = host-scons
-- 
1.7.8.6
