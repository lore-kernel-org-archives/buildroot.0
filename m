From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:36:56 +0100
Subject: [Buildroot] [git commit] package/iptuils: bump version to
	3a86a2542c6fe29413c439bebeae11ec8a57ec7c
Message-ID: <20160302202757.E45207FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8461038f8d4db026538677cee857a3c3324fcb24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-ping-link-against-libm.patch as this has been fixed upstream.
See https://github.com/iputils/iputils/pull/42 and
https://github.com/iputils/iputils/commit/a5ddb78

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/iputils.hash | 2 +-
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index e32e134..1cd8ed3 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	0e98cb527fa175d1e08afb969c124e452b30968f10ec2c3b078f1440c8977a94	iputils-c8ff6feaf0442f8efd96ccb415770c54f9e84d47.tar.gz
+sha256	73de246aee1fd3cd69b1341a0c4e1b4acfa655fe6f7363fd9424824aa8bf5a57	iputils-3a86a2542c6fe29413c439bebeae11ec8a57ec7c.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 92e2bc9..522be9b 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
+IPUTILS_VERSION = 3a86a2542c6fe29413c439bebeae11ec8a57ec7c
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
