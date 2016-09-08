From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:15:21 +0200
Subject: [Buildroot] [git commit] Config.in: remove
	BR2_DEPRECATED_SINCE_2015_05
Message-ID: <20160908201712.32ACB81ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d6c48436738b4dbedcfde74a65eace74e1b1c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now unused.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Config.in b/Config.in
index fdc1ad0..74d29b0 100644
--- a/Config.in
+++ b/Config.in
@@ -369,10 +369,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2015_05
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2015_08
 	bool
 	default y
