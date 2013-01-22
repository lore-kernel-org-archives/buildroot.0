From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:50 -0300
Subject: [Buildroot] [PATCH 5/8] sdparm: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdparm/sdparm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index b251b3c..ef30887 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -1,5 +1,7 @@
 SDPARM_VERSION = 1.07
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
 SDPARM_SITE = http://sg.danny.cz/sg/p/
+SDPARM_LICENSE = BSD-3c
+SDPARM_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.12.4
