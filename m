From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:49:12 +0100
Subject: [Buildroot] [PATCHv1 23/26] python-serial: allow to build with
	Python 3
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-24-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-serial/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index df26af1..72f5567 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  python-serial is a Python library to access serial ports.
 
-- 
1.8.3.2
