From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:41:19 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/perl-sys-cpu: add
 an upstream URL to Config.in
Message-ID: <20191225214909.884298E522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1dd41ba9d6ce2ff1275e1ecfab683e0d969dd50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c74afc1287df5b1a3ebe5eae51c7eadf46ca145)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
