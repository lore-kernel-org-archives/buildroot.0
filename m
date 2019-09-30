From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:50:46 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/joe: license is
 GPL-2.0+
Message-ID: <20190930134539.BE32F83762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba687de7770199e9753e18b7cdfdf8815dab647f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Joe changed the COPYING file from GPL-1.0 to GPL-2.0 in the development
leading up to 3.8:

https://sourceforge.net/p/joe-editor/mercurial/ci/d731f9b3794bc4c896f2efa1c97ac2c82c3365ac/

So change the license to GPL-2.0+

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0d26068b38a098764a57636d8d7c5cd47c24b014)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/joe/joe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index 3d0e9f7769..3aef8e4c82 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -6,7 +6,7 @@
 
 JOE_VERSION = 4.4
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
-JOE_LICENSE = GPL-1.0+
+JOE_LICENSE = GPL-2.0+
 JOE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
