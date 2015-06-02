From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue,  2 Jun 2015 08:28:19 -0500
Subject: [Buildroot] [PATCH v7 03/22] python-pyparsing: Add host build option
In-Reply-To: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1433251718-3167-4-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - No changes
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
