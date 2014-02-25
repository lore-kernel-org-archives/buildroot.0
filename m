From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 20:50:13 +0100
Subject: [Buildroot] [git commit] haserl: mark old 0.8 version as deprecated
Message-ID: <20140225200719.9418D9BA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e722f7cc2331339d116304556ec32468b40fac5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.8 version hasn't seen any updates since 2005, and there's no real
reason to continue to use it today, so deprecate it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haserl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index ddcf3e0..bfe1df8 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -25,6 +25,7 @@ choice
 
 config BR2_PACKAGE_HASERL_VERSION_0_8_X
 	bool	"v 0.8.x"
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	help
 	  stable version
 
