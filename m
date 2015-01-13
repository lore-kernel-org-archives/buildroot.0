From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Jan 2015 14:36:07 +0200
Subject: [Buildroot] [PATCH 3/3] omniorb: remove redundant INSTALL_TARGET
In-Reply-To: <b6614b5357753ff8a3580e80936d8fd19e0857bd.1421152567.git.baruch@tkos.co.il>
References: <b6614b5357753ff8a3580e80936d8fd19e0857bd.1421152567.git.baruch@tkos.co.il>
Message-ID: <33386e68f5938751fd6a4c94b5388f14ba263940.1421152567.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/omniorb/omniorb.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b59d256ca843..bf5ba47b4f01 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -12,7 +12,6 @@ OMNIORB_LICENSE = GPL2+ LGPLv2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
-OMNIORB_INSTALL_TARGET = YES
 
 # 0001-uclinux-is-also-linux.patch touches configure.ac
 OMNIORB_AUTORECONF = YES
-- 
2.1.4
