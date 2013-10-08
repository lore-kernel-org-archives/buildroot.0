From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:19:09 +0200
Subject: [Buildroot] [git commit] stress: add license information
Message-ID: <20131008203904.0BBF09B975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f65e8e31a5cbd27ae3aced271de7cffc4713ac4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress/stress.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 6e82b50..63efb66 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -6,6 +6,8 @@
 
 STRESS_VERSION = 1.0.4
 STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
+STRESS_LICENSE = GPLv2+
+STRESS_LICENSE_FILES = COPYING
 STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
