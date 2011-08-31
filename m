From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:01 +0200
Subject: [Buildroot] [PATCH 2/7] scripts/mkmakefile: fix typo
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2ddf12f8d2d8de71aa42c3dc779f4d891d5e93db.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.4.1
