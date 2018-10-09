From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 14:46:57 +0200
Subject: [Buildroot] [git commit] perl-plack: re-indent Config.in help text
Message-ID: <20181009124615.5951E8E5FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335b4ee2ce96220bcc3e047b033316c650c7d9d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/perl-plack/Config.in:18: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-plack/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index b7f5ecf1c6..50d56e439c 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PERL_PLACK
 	select BR2_PACKAGE_PERL_URI
 	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
 	help
-	  Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)
+	  Perl Superglue for Web frameworks and Web Servers (PSGI
+	  toolkit)
 
 	  https://github.com/plack/Plack
