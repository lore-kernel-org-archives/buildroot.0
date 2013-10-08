From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:18:16 +0200
Subject: [Buildroot] [git commit] stress: fix download url
Message-ID: <20131008203903.F21E39B975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=972a73e61aa6b73ce8ac8cffcf03a374d4d07b5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress/stress.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index df9065a..6e82b50 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STRESS_VERSION = 1.0.4
-STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
+STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
 STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
