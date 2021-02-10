From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 10:02:55 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sox: remove EOL
 whitespace
Message-ID: <20210210085153.DF04F83984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf4ad2f9a7b54ef3a09fc166ddaec8f523605cfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1010083301

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c7eefe19cc0499ec3b7404dc378029d20df65c41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 80f4924704..dbe36d2da6 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOX_VERSION = 7524160b29a476f7e87bc14fddf12d349f9a3c5e 
+SOX_VERSION = 7524160b29a476f7e87bc14fddf12d349f9a3c5e
 SOX_SITE = git://git.code.sf.net/p/sox/code
 SOX_SITE_METHOD = git
 SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
