From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:54:01 +0100
Subject: [Buildroot] [git commit] package/perl-sys-cpu: add an upstream URL
 to Config.in
Message-ID: <20191222214502.47BB08DA8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c74afc1287df5b1a3ebe5eae51c7eadf46ca145
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sys-cpu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
index 8306b371dc..70cfded8ff 100644
--- a/package/perl-sys-cpu/Config.in
+++ b/package/perl-sys-cpu/Config.in
@@ -5,5 +5,7 @@ config BR2_PACKAGE_PERL_SYS_CPU
 	  Perl module for getting information about the system CPU
 	  (Sys::CPU).
 
+	  http://search.cpan.org/dist/Sys-CPU/
+
 comment "perl-sys-cpu needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
