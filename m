From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Oct 2013 21:49:08 +0200
Subject: [Buildroot] [PATCH 3/9] manual: update dependency list to build the
	documentation
In-Reply-To: <cover.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
Message-ID: <b03af600c8b5b0cfd0de60397918367cc3aeeaec.1381002281.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/prerequisite.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 78ce436..74b6a6c 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -76,4 +76,7 @@ development context (further details: refer to xref:download-infra[]).
 ** The +jar+ tool
 
 * Documentation generation tools:
-** +asciidoc+
+** +asciidoc+ version 8.6.3 or later
+** +dblatex+
+** +w3m+
+** +python+ with +argparse+ module
-- 
1.8.4
