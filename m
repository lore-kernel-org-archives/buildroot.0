From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:28 +0200
Subject: [Buildroot] [PATCH 21/24] python-markupsafe: drop unused host
	variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-22-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python-markupsafe/python-markupsafe.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index c815728cd505..9c7eb14c971c 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -12,4 +12,3 @@ PYTHON_MARKUPSAFE_LICENSE = BSD-3c
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.1.0
