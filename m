From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 15:26:18 +0100
Subject: [Buildroot] [PATCH v2, 3/4] package/python-typing: add host variant
In-Reply-To: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
References: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210142619.8207-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-typing is needed for mongodb 4.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-typing/python-typing.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index acb5316129..663227dfc9 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -12,3 +12,4 @@ PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.14.1
