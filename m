From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 24 Mar 2021 13:36:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/ser2net: bump verstion to 4.3.3
In-Reply-To: <20210324123605.24228-1-heiko.thiery@gmail.com>
References: <20210324123605.24228-1-heiko.thiery@gmail.com>
Message-ID: <20210324123605.24228-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 32783213c6..c6f0bb12a3 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  ee74b7db3bdca09c18a4d0a5ef060c9c  ser2net-4.3.2.tar.gz
-sha1  196e954be4086d322ec9312c018cd2155ee601b8  ser2net-4.3.2.tar.gz
+md5  8209d3dc88a6e16b4f62adbc367e510a  ser2net-4.3.3.tar.gz
+sha1  d735a3f6daaa8334e0ef5d8d1a81f88b61dafb8f  ser2net-4.3.3.tar.gz
 # Locally computed:
-sha256  39d93bbaf53ae23c85ceef918b176b89c20b417c95c1797a5554f441334c42bf  ser2net-4.3.2.tar.gz
+sha256  f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720  ser2net-4.3.3.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index bf743239ea..0650ba5b99 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.2
+SER2NET_VERSION = 4.3.3
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.30.0
