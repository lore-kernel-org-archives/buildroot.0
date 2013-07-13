From: Rohan Fletcher <rohfledev@gmail.com>
Date: Sat, 13 Jul 2013 21:19:18 +1200
Subject: [Buildroot] [PATCH 2/2] python-pip: added license
In-Reply-To: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
References: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
Message-ID: <1373707158-31756-2-git-send-email-rohfledev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
---
 package/python-pip/python-pip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 7cf8ab4..9f78d83 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -9,6 +9,7 @@ PYTHON_PIP_VERSION = 1.3.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://pypi.python.org/packages/source/p/pip
 PYTHON_PIP_DEPENDENCIES = python python-setuptools host-python-setuptools host-python-pip
+PYTHON_PIP_LICENSE = MIT
 
 # README.rst refers to the file "LICENSE" but it's not included
 
-- 
1.8.1.2
