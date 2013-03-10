From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:50 +0100
Subject: [Buildroot] [PATCH 09/10] directfb-examples: adding license
	information
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-10-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>


Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb-examples/directfb-examples.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 1342047..14e544c 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -7,6 +7,8 @@
 DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
+DIRECTFB_EXAMPLES_LICENSE = MIT
+DIRECTFB_EXAMPLES_LICENSE_FILE = COPYING
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
-- 
1.7.10.4
