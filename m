From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:40 +0200
Subject: [Buildroot] [PATCH 09/21] package/snappy: do not line-up variables
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <1f8d81da242ce73b8e7b1c281b6d4fa848adff76.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/snappy/snappy.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index b94f8cc..c30cb3c 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SNAPPY_VERSION		= 1.1.1
-SNAPPY_SITE		= http://snappy.googlecode.com/files/
-SNAPPY_LICENSE		= BSD-3c
-SNAPPY_LICENSE_FILES	= COPYING
-SNAPPY_INSTALL_STAGING	= YES
+SNAPPY_VERSION = 1.1.1
+SNAPPY_SITE = http://snappy.googlecode.com/files/
+SNAPPY_LICENSE = BSD-3c
+SNAPPY_LICENSE_FILES = COPYING
+SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.8.3.2
