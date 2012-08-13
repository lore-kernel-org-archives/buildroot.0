From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:37 -0300
Subject: [Buildroot] [PATCH 3/7] iw: bump to version 3.6
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-3-git-send-email-gustavo@zacarias.com.ar>
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
index bf23520..9c68093 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 3.5
+IW_VERSION = 3.6
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
-- 
1.7.8.6
