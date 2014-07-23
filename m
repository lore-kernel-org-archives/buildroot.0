From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:33:20 +0200
Subject: [Buildroot] [PATCH 3/4] python3: define license and license files
In-Reply-To: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1406140401-16997-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3aa22b2..4941316 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -8,6 +8,8 @@ PYTHON3_VERSION_MAJOR = 3.4
 PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
+PYTHON3_LICENSE = Python software foundation license v2, others
+PYTHON3_LICENSE_FILES = LICENSE
 
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
-- 
2.0.0
