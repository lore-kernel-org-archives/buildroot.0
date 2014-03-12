From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 12 Mar 2014 11:45:57 +0800
Subject: [Buildroot] [PATCH 05/10 v2] package/dtc: Update to v1.4.0
In-Reply-To: <1394595957.563937.119075350083.0.gpush@pablo>
Message-ID: <1394595957.565567.501633726418.5.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we're using an untagged commit of dtc. Since inclusion in
buildroot, version 1.4.0 has been released, which includes new
endian-annotated type defintions.

We want to use these type definitions in kexec-lite, so update to the
new release.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/dtc/dtc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
