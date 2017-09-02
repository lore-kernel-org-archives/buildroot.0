From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:49 -0000
Subject: [Buildroot] [git commit] python-mistune: add host variant
Message-ID: <20170902130617.BE20F818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=720c29cad25e2a4ee5fef399618a39b4aab15a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host variant is required by host-python-m2r.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-mistune/python-mistune.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 6bc0b20..4141729 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -12,3 +12,4 @@ PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
