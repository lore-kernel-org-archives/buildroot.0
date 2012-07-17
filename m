From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:07:15 +0200
Subject: [Buildroot] [git commit] bzip2: define license
Message-ID: <20120717173300.EF02E96A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc184a11445fb0f1959a04ff5d3dcab345d3bed5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bzip2/bzip2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 59c993e..07a26c0 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -7,6 +7,8 @@
 BZIP2_VERSION = 1.0.6
 BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
 BZIP2_INSTALL_STAGING = YES
+BZIP2_LICENSE = bzip2 license
+BZIP2_LICENSE_FILES = LICENSE
 
 define BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
