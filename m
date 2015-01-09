From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:05 -0600
Subject: [Buildroot] [PATCH v4 04/27] python-pyparsing: Add host build option
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/python-pyparsing/python-pyparsing.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 8e83f34..0f5fb71 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -12,3 +12,4 @@ PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
