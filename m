From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 17:57:43 +0100
Subject: [Buildroot] [git commit] elf2flt: change source site
Message-ID: <20140204170050.02C849C7D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92f551abecd2323d992145973b1dbde85aa030c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CVS repository for this package is no longer available. So
changing the repository to be a mirror git repository.

Fixes:
  http://autobuild.buildroot.net/results/779/77997fd75282c355f6270b92371c161c9457d1dd

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elf2flt/elf2flt.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index ce40f8d..6f54fb2 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 20130904
-ELF2FLT_SITE = cvs://cvs.uclinux.org:/var/cvs
-ELF2FLT_SITE_METHOD = cvs
+ELF2FLT_VERSION = 21c6a41885ad544763ccd19883c1353f3b0b7a47
+ELF2FLT_SITE = git://wh0rd.org/elf2flt.git
+ELF2FLT_SITE_METHOD = git
 ELF2FLT_LICENSE = GPLv2+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
