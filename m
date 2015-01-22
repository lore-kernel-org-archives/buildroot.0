From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:10:07 -0500
Subject: [Buildroot] [PATCH 3/3] Set correct license
In-Reply-To: <1421953807-8902-1-git-send-email-codehero@gmail.com>
References: <20150117193703.GB2827@tarshish>
 <1421953807-8902-1-git-send-email-codehero@gmail.com>
Message-ID: <1421953807-8902-3-git-send-email-codehero@gmail.com>
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
index 45999ef..37788f9 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -6,7 +6,7 @@
 
 BENEJSON_VERSION = 0.9.7
 BENEJSON_SITE =  $(call github,codehero,benejson,$(BENEJSON_VERSION))
-BENEJSON_LICENSE = BSD-3c
+BENEJSON_LICENSE = MIT
 BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
 
-- 
1.7.8.6
