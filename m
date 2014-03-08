From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 15:08:24 +0100
Subject: [Buildroot] [git commit] perl: needs MMU
Message-ID: <20140308140846.2A9849BE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18bca3ef2438c5a0976a70e569d582152c5d774a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see build http://autobuild.buildroot.net/results/ba7/ba71d0d532ccd8e16b727cddd5dcaa5521074945/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index b2991b0..cdd5aab 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL
 	bool "perl"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Larry Wall's Practical Extraction and Report Language
 	  An interpreted scripting language, known among some as "Unix's Swiss
