From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:28:13 +0200
Subject: [Buildroot] [git commit] ipkg: add license information
Message-ID: <20140701224921.BB90A9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a216d1a43e5ee2a3e82683976babc0852b9ccda9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipkg/ipkg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index b9cba58..10ef207 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -7,5 +7,7 @@
 IPKG_VERSION = 0.99.163
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
+IPKG_LICENSE = GPLv2+
+IPKG_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
