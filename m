From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:16:41 +0200
Subject: [Buildroot] [git commit] Config.in: remove
	BR2_DEPRECATED_SINCE_2015_08
Message-ID: <20160908201712.646B680DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2216c6bb472d9e91c3f4e3f974d7a7af759ed77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Config.in b/Config.in
index 74d29b0..6db36b9 100644
--- a/Config.in
+++ b/Config.in
@@ -369,10 +369,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2015_08
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2015_11
 	bool
 	default y
