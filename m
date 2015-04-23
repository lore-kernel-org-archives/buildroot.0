From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Apr 2015 00:28:43 +0200
Subject: [Buildroot] [git commit] Makefile: add list-defconfig to the
	general help
Message-ID: <20150423224538.DFA3081D79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de6377e8d9c1e4a9d78c100329b28902622ee60f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When listing defconfig files was moved to its own make target, it was
not added to the general help text.

However, this is a very important topic, so list it.

[Peter: drop ':' character]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 5de4789..6a7581a 100644
--- a/Makefile
+++ b/Makefile
@@ -886,6 +886,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
