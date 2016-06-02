From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Jun 2016 13:24:00 +0200
Subject: [Buildroot] [git commit] qlibc: unbreak legal-info after version
	bump
Message-ID: <20160602112648.BC24A800DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c12e1e9d01e1cd949a0d0d8ca0252f16b506ee30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/12f/12f89408935143050a27d92f4b6796d50da07da1/

The recent version bump to v2.4.1 forgot to update the name of the license
file which has been renamed upstream (and reindented/copyright year updated,
but is otherwise identical).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qlibc/qlibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 5aee1f4..a146fa3 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -7,7 +7,7 @@
 QLIBC_VERSION = v2.4.1
 QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2c
-QLIBC_LICENSE_FILES = COPYING
+QLIBC_LICENSE_FILES = LICENSE
 
 # We're patching configure.ac
 QLIBC_AUTORECONF = YES
