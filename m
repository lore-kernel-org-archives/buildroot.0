From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 09:36:17 +0100
Subject: [Buildroot] [PATCH 1/3] urg: fix license
In-Reply-To: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363595779-5094-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The urg.mk file mentions a LGPLv3+ license. However, none of the
source code in the urg package carries a copyright notice that
indicates the "v3 or later". The only license information we have is
the COPYING file, that contains the text of the LGPLv3
license. Therefore, we should probably assume that the code is under
LGPLv3 only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/urg/urg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 3f68bf2..b544ece 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -7,7 +7,7 @@
 URG_VERSION = 0.8.18
 URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
 URG_SOURCE = urg-$(URG_VERSION).zip
-URG_LICENSE = LGPLv3+
+URG_LICENSE = LGPLv3
 URG_LICENSE_FILES = COPYING
 
 URG_INSTALL_STAGING = YES
-- 
1.7.9.5
