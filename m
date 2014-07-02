From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:02 -0300
Subject: [Buildroot] [PATCH 04/13] texinfo: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/texinfo/texinfo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
index 7064e12..afb3bca 100644
--- a/package/texinfo/texinfo.mk
+++ b/package/texinfo/texinfo.mk
@@ -10,5 +10,7 @@
 
 TEXINFO_VERSION = 4.13a
 TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
+TEXINFO_LICENSE = GPLv3+
+TEXINFO_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
-- 
1.8.5.5
