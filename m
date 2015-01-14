From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] omniorb: remove redundant INSTALL_TARGET
Message-ID: <20150114154902.20D4E80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f252bcc3a761a4be8550638ac128834f36fab9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/omniorb.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b59d256..bf5ba47 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -12,7 +12,6 @@ OMNIORB_LICENSE = GPL2+ LGPLv2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
-OMNIORB_INSTALL_TARGET = YES
 
 # 0001-uclinux-is-also-linux.patch touches configure.ac
 OMNIORB_AUTORECONF = YES
