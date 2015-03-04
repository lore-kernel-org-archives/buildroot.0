From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:13:40 +0100
Subject: [Buildroot] [git commit] Config.in: remove
	BR2_DEPRECATED_SINCE_2014_02
Message-ID: <20150304211938.B800581807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6aeba2b3105bca932605a4f99a0f9a0c6ed04ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol is unused so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 0598042..2b39d6a 100644
--- a/Config.in
+++ b/Config.in
@@ -296,10 +296,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2014_02
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2014_05
 	bool
 	default y
