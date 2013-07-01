From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:41:22 +0200
Subject: [Buildroot] [git commit] legacy: make it clear legacy options will
	be removed at some point
Message-ID: <20130701094855.7B07D99A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2e706c3bba623d82bbc1f76d5b0c02efb2bd0fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1252d16..921a0eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -38,6 +38,10 @@ comment "Please look at the options which have been selected "
 comment "and read their help text.                           "
 comment "As long as these options stay selected, the build   "
 comment "will fail.                                          "
+comment "Note: at some point in the future, the oldest legacy"
+comment "options will be removed, and configuration files    "
+comment "that still have those options set, will fail to     "
+comment "build, or run, in unpredictable ways.               "
 endif
 
 ###############################################################################
