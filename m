From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:27:57 +0200
Subject: [Buildroot] [PATCH 4/8] python-versiontools: add host variant
In-Reply-To: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170712162801.31131-5-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It will be needed by python-json-schema-validator.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-versiontools/python-versiontools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index 2170730..fbf1040 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -11,3 +11,4 @@ PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
 PYTHON_VERSIONTOOLS_LICENSE = LGPL-3.0
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.9.4
