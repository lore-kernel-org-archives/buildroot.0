From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2013 07:26:49 +0100
Subject: [Buildroot] [git commit] jq: switch to official tarball
Message-ID: <20131201201519.DFA6D9BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85ccc07b7427b54c20ed39264c9995279b0ff1d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ships configure thus fixing the breakage from the automake bump
to version 1.14 with AUTORECONF, with the added bonus of being faster.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 8d4f24f..cc7c99e 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JQ_VERSION = jq-1.3
-JQ_SITE = http://github.com/stedolan/jq/tarball/$(JQ_VERSION)
-JQ_AUTORECONF = YES
+JQ_VERSION = 1.3
+JQ_SITE = http://stedolan.github.io/jq/download/source
 JQ_DEPENDENCIES = host-flex host-bison
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
