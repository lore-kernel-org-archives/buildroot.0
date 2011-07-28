From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jul 2011 17:14:02 -0300
Subject: [Buildroot] [PATCH 2/3] iw: bump to version 3.0
In-Reply-To: <1311884043-2473-1-git-send-email-gustavo@zacarias.com.ar>
References: <1311884043-2473-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1311884043-2473-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 0f5dd0e..be3edc2 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.22
+IW_VERSION = 3.0
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
-- 
1.7.3.4
