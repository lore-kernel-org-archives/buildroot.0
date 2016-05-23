From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:37:41 +0200
Subject: [Buildroot] [git commit branch/next] lft: switch to upstream
	provided URL
Message-ID: <20160523105000.8ECD081DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a2d79a51bc28756deecceb7d6e9265d93b23a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lft/lft.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 0779300..24e6a10 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LFT_VERSION = 3.74
-# Download from pwhois.org is form-wrapped resulting in ugly filename
-LFT_SITE = https://fossies.org/linux/privat
+LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
 LFT_LICENSE_FILES = COPYING
