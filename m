From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:24:52 -0800
Subject: [Buildroot] [git commit] acpid: add license information
Message-ID: <20121130203747.8A82B995A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a53d732cdf5732dd2cf1ba7355d133df1849f16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Patch: change to GPLv2+]
Signed-off-by: Simon Dawson <simond@trainfx.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/acpid/acpid.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 56f671d..4ad9f66 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -6,6 +6,8 @@
 ACPID_VERSION = 2.0.11
 ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
 ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
+ACPID_LICENSE = GPLv2+
+ACPID_LICENSE_FILES = COPYING
 
 define ACPID_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
