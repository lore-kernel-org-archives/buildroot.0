From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] botan: remove redundant INSTALL_TARGET
Message-ID: <20150114154902.0BF5C80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cb5492ec5603737b8e3162f4844dfcfc7a21ae7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/botan/botan.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 9c41c9b..27926a8 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,7 +11,6 @@ BOTAN_LICENSE = BSD-2c
 BOTAN_LICENSE_FILES = doc/license.txt
 
 BOTAN_INSTALL_STAGING = YES
-BOTAN_INSTALL_TARGET = YES
 
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
