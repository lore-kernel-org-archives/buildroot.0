From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 16:18:15 +0100
Subject: [Buildroot] [git commit] package/dtc: Update to v1.4.0
Message-ID: <20140329151820.459BF9C3AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24b651f0d897a423dd2f84f914aff6924ad04a3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we're using an untagged commit of dtc. Since inclusion in
buildroot, version 1.4.0 has been released, which includes new
endian-annotated type defintions.

We want to use these type definitions in kexec-lite, so update to the
new release.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a230e60..a6898f2 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
+DTC_VERSION         = v1.4.0
 DTC_SITE            = git://git.jdl.com/software/dtc.git
 DTC_LICENSE         = GPLv2+/BSD-2c
 DTC_LICENSE_FILES   = README.license GPL
