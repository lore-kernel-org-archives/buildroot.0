From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:06:58 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: update comment that old
 entries have been removed
Message-ID: <20171228090718.6536581E7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b39b14b27700ff4cde566b704d9f633f9230a30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bff8563..f52469d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -135,10 +135,10 @@ comment "legacy options in the menu below. Once you have     "
 comment "disabled all legacy options, this text will         "
 comment "disappear and you will be able to start the build.  "
 comment "*                                                   "
-comment "Note: at some point in the future, the oldest legacy"
-comment "options will be removed, and configuration files    "
-comment "that still have those options set, will fail to     "
-comment "build, or run, in unpredictable ways.               "
+comment "Note: legacy options older than 5 years have been   "
+comment "removed, and configuration files that still have    "
+comment "those options set, will fail to build, or run in    "
+comment "unpredictable ways.                                 "
 comment "----------------------------------------------------"
 endif
 
