From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:53 +0530
Subject: [Buildroot] [PATCH 4/6] python-mwscrape: use documented license
	abbreviation
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490204935-13172-4-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For MPL version 2.0, we use MPLv2.0 as license abbreviation.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/python-mwscrape/python-mwscrape.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
index 47b943f..5054675 100644
--- a/package/python-mwscrape/python-mwscrape.mk
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
 PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
-PYTHON_MWSCRAPE_LICENSE = MPL-2.0
+PYTHON_MWSCRAPE_LICENSE = MPLv2.0
 PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
 PYTHON_MWSCRAPE_SETUP_TYPE = distutils
 
-- 
2.6.2
