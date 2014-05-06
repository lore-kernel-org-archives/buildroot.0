From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:44 -0500
Subject: [Buildroot] [PATCH 09/11] xerces: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-10-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/xerces/xerces.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7bd7070..9402abe 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -7,6 +7,8 @@
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
+XERCES_LICENSE = Apache-2.0
+XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPT = --disable-threads \
-- 
1.7.9.5
