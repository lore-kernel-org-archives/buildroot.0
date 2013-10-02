From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 10:00:14 +0200
Subject: [Buildroot] [git commit] jamvm: add license info
Message-ID: <20131002080115.331A09B914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5deb7ae303c13c61fd7fd4dce848024a8e9d4d79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jamvm/jamvm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index 34f1b9f..53455c4 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -6,6 +6,8 @@
 
 JAMVM_VERSION = 1.5.4
 JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
+JAMVM_LICENSE = GPLv2+
+JAMVM_LICENSE_FILES = COPYING
 JAMVM_DEPENDENCIES = zlib classpath
 # int inlining seems to crash jamvm, don't build shared version of internal lib
 JAMVM_CONF_OPT = \
