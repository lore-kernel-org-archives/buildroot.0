From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:39 -0500
Subject: [Buildroot] [PATCH 04/11] python-netifaces: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-5-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/python-netifaces/python-netifaces.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index faa39bd..33d63cf 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -7,6 +7,8 @@
 PYTHON_NETIFACES_VERSION = 0.7
 PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_LICENSE = MIT
+PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
1.7.9.5
