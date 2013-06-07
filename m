From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 19:03:26 -0500
Subject: [Buildroot] [PATCH 1/1] manual: correct error in github tarball
	information
In-Reply-To: <20130606234413.AA3569A982@busybox.osuosl.org>
References: <20130606234413.AA3569A982@busybox.osuosl.org>
Message-ID: <1370563406-3124-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updates to manual for bug 6302

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 docs/manual/adding-packages-tips.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 21e520b..f435add 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -58,7 +58,7 @@ enough):
 
 ------------------------
 FOO_VERSION = 1234567
-FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
 ------------------------
 
 Note that the name of the tarball is the default +foo-1234567.tar.gz+
-- 
1.7.9.5
