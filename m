From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 08:22:12 +0200
Subject: [Buildroot] [git commit] scripts/mkmakefile: fix typo
Message-ID: <20110917063642.AAAAF8D72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3e304db0f0ef583efb250a19663259bb6dc60c93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 scripts/mkmakefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index 38d8268..cef2ec7 100755
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -1,7 +1,7 @@
 #!/bin/sh
 # Generates a small Makefile used in the root of the output
 # directory, to allow make to be started from there.
-# The Makefile also allow for more convinient build of external modules
+# The Makefile also allow for more convenient build of external modules
 
 # Usage
 # $1 - Kernel src directory
-- 
1.7.3.4
