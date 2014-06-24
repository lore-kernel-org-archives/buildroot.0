From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:10 -0300
Subject: [Buildroot] [PATCH 04/54] leafpad: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/leafpad/leafpad.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index b533ea0..6366cab 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -7,5 +7,7 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
+LEAFPAD_LICENSE = GPLv2+
+LEAFPAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
