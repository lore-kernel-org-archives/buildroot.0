From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2014 09:57:15 +0100
Subject: [Buildroot] [git commit] jasper: fix license typo
Message-ID: <20140130085940.57C9C9C6FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61e343970d6ec6b1fc87d9509d8a35555facde55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b349cfc..7917c6a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,6 @@ JASPER_SOURCE = jasper-$(JASPER_VERSION).tar.bz2
 JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = MIT
-JASPER_LICENSE_FILE = LICENSE
+JASPER_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
