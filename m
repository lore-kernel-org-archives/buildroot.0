From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:52 +0100
Subject: [Buildroot] [RFC 7/8] Makefile: point users to the per-package help
	text
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that each package has its own help text, mention it in the main
help text available from "make help".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 1e5390b..adf3558 100644
--- a/Makefile
+++ b/Makefile
@@ -878,6 +878,7 @@ help:
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  <pkg>-help		- get help about a specific package'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
2.1.0
