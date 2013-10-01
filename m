From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 00:02:27 +0200
Subject: [Buildroot] [git commit] tremor: add license info
Message-ID: <20131001220629.ABBCC9B902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b583a16c71689d252652602f7bef5eaa76a4a2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tremor/tremor.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 291a413..b1515c1 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -7,6 +7,8 @@
 TREMOR_SITE = http://svn.xiph.org/trunk/Tremor/
 TREMOR_SITE_METHOD = svn
 TREMOR_VERSION = 18153
+TREMOR_LICENSE = BSD-3c
+TREMOR_LICENSE_FILES = COPYING
 
 TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
