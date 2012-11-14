From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:33:55 +0100
Subject: [Buildroot] [git commit] libffi: add license info
Message-ID: <20121114214727.7531799FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0189bc2744501913114f69c7e87585da017d0d42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 81ac043..7570583 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -6,6 +6,8 @@
 
 LIBFFI_VERSION = 3.0.11
 LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
+LIBFFI_LICENSE = MIT
+LIBFFI_LICENSE_FILES = LICENSE
 
 LIBFFI_INSTALL_STAGING = YES
 
