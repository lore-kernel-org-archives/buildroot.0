From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Aug 2018 08:32:00 +0200
Subject: [Buildroot] [git commit] CHANGES: add note about Vivante graphics /
 i.MX8MQ support for 2018.08-rc1
Message-ID: <20180830063355.01FC281EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=827b4bb117bd22c8a02d561b59b6c8e863d9d540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As requested by Gary Bisson.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGES b/CHANGES
index c1cecb8023..36bcfe0bb3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -54,6 +54,8 @@
 	- X.org server bumped to 1.20, and all X.org proto packages
 	  replaced by the single xorgproto package
 	- i.MX6 support packages bumped to 6.2.4
+	- i.MX Vivante graphics version bumped to 6.2.4.p1.2,
+	  adding support for Wayland and i.MX8MQ platforms
 
 	Linux: bumped to 4.17 by default.
 
