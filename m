From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:40:14 +0200
Subject: [Buildroot] [git commit] perl: fix license info
Message-ID: <20131008204238.A98339B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83630bc494a3bf221187a0e64428a0d18ec4475a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the README, perl can be used either under
Artistic or under GPLv1+ license, so include both.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5ef0b24..ac85ed9 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -8,8 +8,8 @@ PERL_VERSION_MAJOR = 18
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
-PERL_LICENSE = Artistic
-PERL_LICENSE_FILES = Artistic
+PERL_LICENSE = Artistic or GPLv1+
+PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
 PERL_CROSS_VERSION = 0.8
