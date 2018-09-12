From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:04:06 +0200
Subject: [Buildroot] [git commit] perl-sys-cpu: improve Config.in description
Message-ID: <20180912210335.345208757B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b58edfdcb66f2fbc87fa5ece4baf186af18938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also fix a check-package warning due to the lack of upstream
webpage:

package/perl-sys-cpu/Config.in:5: empty line at end of file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sys-cpu/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
index d5fff5b849..a604945740 100644
--- a/package/perl-sys-cpu/Config.in
+++ b/package/perl-sys-cpu/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PERL_SYS_CPU
 	bool "perl-sys-cpu"
 	help
-	  perl-sys-cpu
-
+	  Perl module for getting information about the system CPU
+	  (Sys::CPU).
