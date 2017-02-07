From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:51:23 +0100
Subject: [Buildroot] [git commit] on2-8170-libs: fix typo in variable name
Message-ID: <20170207090318.C709F7FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c10d6b71129a231538cc09903ae478f700113e2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/on2-8170-libs/on2-8170-libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/on2-8170-libs/on2-8170-libs.mk b/package/on2-8170-libs/on2-8170-libs.mk
index db68f02..ad321d8 100644
--- a/package/on2-8170-libs/on2-8170-libs.mk
+++ b/package/on2-8170-libs/on2-8170-libs.mk
@@ -7,7 +7,7 @@
 ON2_8170_LIBS_VERSION = 1.0
 ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
 
-ON2_8170_LICENSE = PROPRIETARY
+ON2_8170_LIBS_LICENSE = PROPRIETARY
 # No license file is included in the archive
 
 ON2_8170_LIBS_INSTALL_STAGING = YES
