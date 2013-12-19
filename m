From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:37:59 -0600
Subject: [Buildroot] [PATCH v5 10/20] python-pyparsing: Add host build option
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-11-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - Changed to new python infrastructure.
Changes v3 -> v4:
  - No changes.
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes.
---
 package/python-pyparsing/python-pyparsing.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 07dda58..4043a4a 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -12,3 +12,4 @@ PYTHON_PYPARSING_LICENSE_FILES   = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE      = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.7.1
