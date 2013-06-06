From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:07:41 +0200
Subject: [Buildroot] [git commit] ne10: fix github tarball to use commit id
Message-ID: <20130606211256.813AA9A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2b205c038bc0dba3960917f2eb1bd30fbc24b03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ne10/ne10.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index f5121ed..9c78c45 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -7,7 +7,7 @@
 # We use a Git commit ID because the last tagged version is more than
 # one year old.
 NE10_VERSION = 88c18f0
-NE10_SITE = http://github.com/projectNe10/Ne10/tarball/master
+NE10_SITE = http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
 NE10_LICENSE = BSD-3c or Apache 2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
