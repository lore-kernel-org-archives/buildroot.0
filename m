From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:24 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 09/11] python-pyparsing:
	Add host build option
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <1455603506-26138-9-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: niranjan.reddy <niranjan.reddy@rockwellcollins.com>

---
Changed v9 -> v10:
  - No changes

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - No changes

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
index ad066b8..c8f304b 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -12,3 +12,4 @@ PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.5.0
