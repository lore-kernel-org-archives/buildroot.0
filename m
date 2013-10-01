From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:25:12 +0200
Subject: [Buildroot] [git commit] ngircd: add license info
Message-ID: <20131001193429.6FAD29B313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce5b2aed7e6b24b53766f215fafb01b7390ea79f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index c99e6bb..d60ac06 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -7,5 +7,7 @@
 NGIRCD_VERSION = 20.3
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
+NGIRCD_LICENSE = GPLv2+
+NGIRCD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
