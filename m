From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:54 +0530
Subject: [Buildroot] [PATCH 5/6] python-certifi: use documented license
	abbreviation
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490204935-13172-5-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For MPL version 2.0, we use MPLv2.0 as license abbreviation.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/python-certifi/python-certifi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 3f83194..cf9ebc2 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -8,7 +8,7 @@ PYTHON_CERTIFI_VERSION = 2017.1.23
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
 PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/b6/fa/ca682d5ace0700008d246664e50db8d095d23750bb212c0086305450c276
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
-PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
+PYTHON_CERTIFI_LICENSE = ISC (Python code), MPLv2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.6.2
